class people::jwmayfield (
  $fonts    = [],
  $alt_apps = []
){
  include people::jwmayfield::os
  include people::jwmayfield::shell
  include people::jwmayfield::vim

  git::config::global {
    'user.email': value    => 'jason@jwmayfield.com' ;
    'user.name':  value    => 'Jason Mayfield' ;
    'color.ui':   value    => 'auto' ;
    'format.pretty': value => 'format:%C(yellow)%h%Creset -%C(red)%d%Creset %s %C(bold green)(%ar) %C(cyan)<%an>%Creset' ;
    'merge.tool': value    => 'vimdiff' ;
    'push.default': value  => 'simple' ;
  }

  # If any fonts are specified, declare them as brewcask packages
  if count($fonts) > 0 {
    include brewcask

    homebrew::tap { 'caskroom/fonts': }

    ensure_resource('package', $fonts, {
      'provider'        => 'brewcask',
      require           => Homebrew::Tap['caskroom/fonts']
    })
  }

  if count($alt_apps) > 0 {
    include brewcask

    homebrew::tap { 'caskroom/versions': }

    ensure_resource('package', $alt_apps, {
      'provider'        => 'brewcask',
      'install_options' => ['--appdir=/Applications',
                            "--binarydir=${boxen::config::homebrewdir}/bin"],
      require           => Homebrew::Tap['caskroom/versions']
    })
  }
}
