# Based on archfear/puppet-prezto
#
class people::jwmayfield::zsh {
  package { 'zsh-lovers': }

  $dotfiles = "${::boxen_srcdir}/dotfiles"
  $home = "/Users/${::luser}"
  $repo = 'sorin-ionescu/prezto'
  $runcoms = "${dotfiles}/zsh"
  $zprezto = "${home}/.zprezto"

  repository { $zprezto:
    source => $repo,
    extra  => ['--recursive']
  }

  file { "${home}/.zlogin":
    ensure  => symlink,
    target  => "${runcoms}/zlogin",
    require => Repository[$dotfiles]
  }

  file { "${home}/.zlogout":
    ensure  => symlink,
    target  => "${runcoms}/zlogout",
    require => Repository[$dotfiles]
  }

  file { "${home}/.zpreztorc":
    ensure  => symlink,
    target  => "${runcoms}/zpreztorc",
    require => Repository[$dotfiles]
  }

  file { "${home}/.zprofile":
    ensure  => symlink,
    target  => "${runcoms}/zprofile",
    require => Repository[$dotfiles]
  }

  file { "${home}/.zshenv":
    ensure  => symlink,
    target  => "${runcoms}/zshenv",
    require => Repository[$dotfiles]
  }

  file { "${home}/.zshrc":
    ensure  => symlink,
    target  => "${runcoms}/zshrc",
    require => Repository[$dotfiles]
  }
}
