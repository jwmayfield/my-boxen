class people::jwmayfield::os {
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::global::tap_to_click

  include osx::dock::disable

  include osx::finder::show_all_on_desktop
  include osx::finder::empty_trash_securely
  include osx::finder::unhide_library
  include osx::finder::show_hidden_files
  include osx::finder::enable_quicklook_text_selection
  include osx::finder::show_warning_before_emptying_trash
  include osx::finder::show_all_filename_extensions
  include osx::finder::no_file_extension_warnings

  include osx::safari::enable_developer_mode

  include osx::no_network_dsstores
  include osx::software_update

  class { 'osx::sound::interface_sound_effects': enable => false }

  boxen::osx_defaults { 'enable duckduckgo':
    ensure => present,
    domain => 'com.apple.Safari',
    key    => 'SearchProviderIdentifier',
    value  => 'com.duckduckgo',
    user   => $::boxen_user
  }
}
