class people::jwmayfield::shell {
  $dotfiles = "${::boxen_srcdir}/dotfiles"
  $home     = "/Users/${::luser}"
  $repo     = 'sorin-ionescu/prezto'
  $runcoms  = "${dotfiles}/zsh"
  $status   = '/private/var/db'
  $zprezto  = "${home}/.zprezto"

  repository { $dotfiles:
    ensure => 'master',
    force  => true,
    source => 'jwmayfield/dotfiles'
  }

  repository { $zprezto:
    source => $repo,
    extra  => ['--recursive']
  }

  exec { 'Customize Terminal.app':
    command  => "bash ${dotfiles}/osx && touch ${status}/.customize-terminal",
    creates  => "${status}/.customize-terminal",
    provider => shell,
    user     => root,
    require  => File[$status]
  }

  file { "${home}/.aliases":
    ensure  => link,
    target  => "${dotfiles}/aliases",
    require => [
      Repository[$dotfiles]
    ]
  }

  file { "${home}/.hgext":
    ensure  => link,
    target  => "${dotfiles}/hgext",
    require => [
      Repository[$dotfiles]
    ]
  }

  file { "${home}/.hgrc":
    ensure  => link,
    target  => "${dotfiles}/hgrc",
    require => [
      Repository[$dotfiles]
    ]
  }

  file { "${home}/.slate":
    ensure  => link,
    target  => "${dotfiles}/slate",
    require => Repository[$dotfiles]
  }

  file { "${home}/.zlogin":
    ensure  => link,
    target  => "${runcoms}/zlogin",
    require => Repository[$dotfiles]
  }

  file { "${home}/.zlogout":
    ensure  => link,
    target  => "${runcoms}/zlogout",
    require => Repository[$dotfiles]
  }

  file { "${home}/.zpreztorc":
    ensure  => link,
    target  => "${runcoms}/zpreztorc",
    require => Repository[$dotfiles]
  }

  file { "${home}/.zprofile":
    ensure  => link,
    target  => "${runcoms}/zprofile",
    require => Repository[$dotfiles]
  }

  file { "${home}/.zshenv":
    ensure  => link,
    target  => "${runcoms}/zshenv",
    require => Repository[$dotfiles]
  }

  file { "${home}/.zshrc":
    ensure  => link,
    target  => "${runcoms}/zshrc",
    require => Repository[$dotfiles]
  }

  file { $status:
    ensure  => directory,
    owner   => 'root',
    group   => 'wheel',
    require => Repository[$dotfiles]
  }
}
