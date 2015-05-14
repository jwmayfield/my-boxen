class people::jwmayfield::vim {
  $dotfiles   = "${::boxen_srcdir}/dotfiles"
  $home       = "/Users/${::luser}"

  # vim config
  file { "${home}/.vimrc":
    ensure  => link,
    target  => "${dotfiles}/vimrc",
    require => Repository[$dotfiles]
  }

  vim::bundle { [
    'altercation/vim-colors-solarized',
    'kien/ctrlp.vim',
    'rodjek/vim-puppet',
    'scrooloose/syntastic',
    'tomtom/tcomment_vim'
  ]: }
}
