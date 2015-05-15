class people::jwmayfield::development {
  $home     = "/Users/${::luser}"

  class { 'vagrant': completion => true }

  vagrant::plugin { 'berkshelf': }
  vagrant::plugin { 'vmware-fusion':
    license => "file:///${home}/Dropbox/Licenses/vagrant-vmware-fusion.lic"
  }
}
