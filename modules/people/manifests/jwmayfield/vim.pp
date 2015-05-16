class people::jwmayfield::vim {
  $dotfiles   = "${::boxen_srcdir}/dotfiles"
  $home       = "/Users/${::luser}"

  file { "${home}/.editorconfig":
    ensure  => link,
    target  => "${dotfiles}/editorconfig",
    require => Repository[$dotfiles]
  }

  file { "${home}/.vimrc":
    ensure  => link,
    target  => "${dotfiles}/vimrc",
    require => Repository[$dotfiles]
  }

  vim::bundle { [
    'altercation/vim-colors-solarized',
    'editorconfig/editorconfig-vim',
    'kien/ctrlp.vim',
    'rodjek/vim-puppet',
    'scrooloose/syntastic',
    'tomtom/tcomment_vim',
    'vim-ruby/vim-ruby'
  ]: }
}
