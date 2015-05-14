class people::jwmayfield {
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
}
