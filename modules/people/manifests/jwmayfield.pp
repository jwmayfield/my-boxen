class people::jwmayfield {
  include people::jwmayfield::vim
  include people::jwmayfield::zsh

  $dotfiles   = "${::boxen_srcdir}/dotfiles"
  $home       = "/Users/${::luser}"
  $status     = '/private/var/db'

  git::config::global {
    'user.email': value    => 'jason@jwmayfield.com' ;
    'user.name':  value    => 'Jason Mayfield' ;
    'color.ui':   value    => 'auto' ;
    'format.pretty': value => 'format:%C(yellow)%h%Creset -%C(red)%d%Creset %s %C(bold green)(%ar) %C(cyan)<%an>%Creset' ;
    'merge.tool': value    => 'vimdiff' ;
    'push.default': value  => 'simple' ;
  }

  # Hg config
  file { "${home}/.hgext":
    ensure  => symlink,
    target  => "${dotfiles}/hgext",
    require => [
      Repository[$dotfiles]
    ]
  }
  file { "${home}/.hgrc":
    ensure  => symlink,
    target  => "${dotfiles}/hgrc",
    require => [
      Repository[$dotfiles]
    ]
  }

  # Slate window manager
  file { "${home}/.slate":
    ensure  => symlink,
    target  => "${dotfiles}/slate",
    require => Repository[$dotfiles]
  }

  repository { $dotfiles:
    ensure => 'master',
    force  => true,
    source => 'jwmayfield/dotfiles'
  }

  file { $status:
    ensure  => directory,
    owner   => 'root',
    group   => 'wheel',
    require => Repository[$dotfiles]
  }

  exec { 'Customize Terminal.app':
    command  => "bash ${dotfiles}/osx && touch ${status}/.customize-terminal",
    creates  => "${status}/.customize-terminal",
    provider => shell,
    user     => root,
    require  => File[$status]
  }

}
