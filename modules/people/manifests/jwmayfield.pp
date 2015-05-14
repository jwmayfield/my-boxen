class people::jwmayfield {
  $my_username      = $::boxen_user
  $my_dotfilesdir   = "${::boxen_srcdir}/dotfiles"
  $my_homedir       = "/Users/${my_username}"
  $my_statusdir     = '/private/var/db'

  git::config::global {
    'user.email': value    => 'jason@jwmayfield.com' ;
    'user.name':  value    => 'Jason Mayfield' ;
    'color.ui':   value    => 'auto' ;
    'format.pretty': value => 'format:%C(yellow)%h%Creset -%C(red)%d%Creset %s %C(bold green)(%ar) %C(cyan)<%an>%Creset' ;
    'merge.tool': value    => 'vimdiff' ;
    'push.default': value  => 'simple' ;
  }

  # Hg config
  file { "${my_homedir}/.hgext":
    ensure  => link,
    target  => "${my_dotfilesdir}/hgext",
    require => [
      Repository[$my_dotfilesdir]
    ]
  }
  file { "${my_homedir}/.hgrc":
    ensure  => link,
    target  => "${my_dotfilesdir}/hgrc",
    require => [
      Repository[$my_dotfilesdir]
    ]
  }

  # Slate window manager
  file { "${my_homedir}/.slate":
    ensure  => link,
    target  => "${my_dotfilesdir}/slate",
    require => Repository[$my_dotfilesdir]
  }

  # vim config
  file { $vim::vimrc:
    ensure  => link,
    target  => "${my_dotfilesdir}/vimrc",
    require => Repository[$my_dotfilesdir]
  }

  vim::bundle { [
    'altercation/vim-colors-solarized',
  ]: }

  repository { $my_dotfilesdir:
    ensure => 'master',
    force  => true,
    source => 'jwmayfield/dotfiles'
  }

  file { $my_statusdir:
    ensure  => directory,
    owner   => 'root',
    group   => 'wheel',
    require => Repository[$my_dotfilesdir]
  }
  exec { 'Enable accessibility API':
    command  => "(echo -n 'a' | sudo tee ${my_statusdir}/.AccessibilityAPIEnabled > /dev/null 2>&1) && chmod 644 ${my_statusdir}/.AccessibilityAPIEnabled",
    creates  => "${my_statusdir}/.AccessibilityAPIEnabled",
    provider => shell,
    user     => root,
    require  => File[$my_statusdir]
  }
  exec { 'Customize Terminal.app':
    command  => "bash ${my_dotfilesdir}/osx && touch ${my_statusdir}/.customize-terminal",
    creates  => "${my_statusdir}/.customize-terminal",
    provider => shell,
    user     => root,
    require  => File[$my_statusdir]
  }

}
