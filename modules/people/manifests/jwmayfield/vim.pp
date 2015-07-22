class people::jwmayfield::vim {
  $dotfiles = "${::boxen_srcdir}/dotfiles"
  $home     = "/Users/${::luser}"
  $vimdir   = "${home}/.vim"
  $vimrc    = "${home}/.vimrc"

  file { "${home}/.editorconfig":
    ensure  => link,
    target  => "${dotfiles}/editorconfig",
    require => Repository[$dotfiles]
  }

  file { [$vimdir,
    "${vimdir}/autoload",
    "${vimdir}/bundle"]:
    ensure  => directory,
    recurse => true,
  }

  file { "${vimdir}/autoload/pathogen.vim":
    target  => "${vimdir}/vim-pathogen/autoload/pathogen.vim",
    require => [
      File[$vimdir],
      File["${vimdir}/autoload"],
      File["${vimdir}/bundle"],
      Repository["${vimdir}/vim-pathogen"]
    ]
  }

  file { "${home}/.vimrc":
    ensure  => link,
    target  => "${dotfiles}/vimrc",
    require => Repository[$dotfiles]
  }

  file_line { 'load_pathogen':
    ensure  => present,
    line    => 'execute pathogen#infect()',
    path    => $vim::vimrc,
    require => File[$vim::vimrc]
  }

  repository { "${vimdir}/vim-pathogen":
    source => 'tpope/vim-pathogen'
  }

  vim::bundle { [
    'altercation/vim-colors-solarized',
    'editorconfig/editorconfig-vim',
    'ervandew/supertab',
    'kien/ctrlp.vim',
    'rodjek/vim-puppet',
    'rust-lang/rust.vim',
    'scrooloose/syntastic',
    'tomtom/tcomment_vim',
    'tpope/vim-endwise',
    'tpope/vim-sensible',
    'vim-ruby/vim-ruby'
  ]: }
}
