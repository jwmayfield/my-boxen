class people::jwmayfield::os {
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::global::tap_to_click

  include osx::dock::clear_dock
  include osx::dock::disable

  include osx::finder::show_all_on_desktop
  include osx::finder::empty_trash_securely
  include osx::finder::unhide_library
  include osx::finder::enable_quicklook_text_selection
  include osx::finder::show_warning_before_emptying_trash
  include osx::finder::show_all_filename_extensions
  include osx::finder::no_file_extension_warnings

  include osx::safari::enable_developer_mode

  include osx::no_network_dsstores
  include osx::software_update

  class { 'osx::sound::interface_sound_effects': enable => false }

  boxen::osx_defaults { 'Check for updates daily':
    ensure => present,
    domain => 'com.apple.SoftwareUpdate',
    key    => 'ScheduleFrequency',
    type   => 'int',
    value  => 1,
    user   => $::boxen_user
  }

  boxen::osx_defaults { 'Finder: show path bar':
    ensure => present,
    domain => 'com.apple.finder',
    key    => 'ShowPathBar',
    type   => 'bool',
    value  => true,
    user   => $::boxen_user
  }

  boxen::osx_defaults { 'Finder: show posix path':
    ensure => present,
    domain => 'com.apple.finder',
    key    => '_FXShowPosixPathInTitle',
    type   => 'bool',
    value  => true,
    user   => $::boxen_user
  }

  boxen::osx_defaults { 'Finder: show status bar':
    ensure => present,
    domain => 'com.apple.finder',
    key    => 'ShowStatusBar',
    type   => 'bool',
    value  => true,
    user   => $::boxen_user
  }

  boxen::osx_defaults { 'Finder: use list view':
    ensure => present,
    domain => 'com.apple.finder',
    key    => 'FXPreferredViewStyle',
    value  => 'Nlsv',
    user   => $::boxen_user
  }

  boxen::osx_defaults { 'Safari: enable duckduckgo':
    ensure => present,
    domain => 'com.apple.Safari',
    key    => 'SearchProviderIdentifier',
    value  => 'com.duckduckgo',
    user   => $::boxen_user
  }

  boxen::osx_defaults { 'Screen saver: require password':
    ensure => present,
    domain => 'com.apple.screensaver',
    key    => 'askForPassword',
    type   => 'int',
    value  => 1,
    user   => $::boxen_user
  }

  boxen::osx_defaults { 'Screen saver: require password immediately':
    ensure => present,
    domain => 'com.apple.screensaver',
    key    => 'askForPasswordDelay',
    type   => 'int',
    value  => 0,
    user   => $::boxen_user
  }
}
