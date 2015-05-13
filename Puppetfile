# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod "puppet-#{name}", :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.10.4"

# Support for default hiera data in modules

github "module_data", "0.0.3", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "brewcask",    "0.0.6"
github "foreman",     "1.2.0"
github "gcc",         "2.2.1"
github "git",         "2.7.9"
github "homebrew",    "1.12.0"
github "hub",         "1.4.1"
github "inifile",     "1.1.1", :repo => "puppetlabs/puppetlabs-inifile"
github "nodejs",      "4.0.1"
github "openssl",     "1.0.0"
github "pkgconfig",   "1.0.0"
github "python",      "3.0.0", :repo => "mloberg/puppet-python"
github "repository",  "2.4.1", :repo => "jwmayfield/puppet-repository"
github "ruby",        "8.5.2"
github "stdlib",      "4.2.1", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.1"


# NOTE: Items from old boxen setup.
# NOTE: NOT going to carry all of these forward.
#
# github "autoconf",   "1.0.0"
# github "dnsmasq",    "2.0.1"
# github "foreman",     "1.2.0"
# github "gcc",        "2.2.0"
# github "git",        "2.7.0"
# github "go",          "2.1.0"
# github "homebrew",   "1.9.8"
# github "hub",        "1.3.0"
# github "mongodb",    "1.3.3"
# github "nodejs",     "4.0.0"
# github "openssl",    "1.0.0"
# github "phantomjs",  "2.3.0"
# github "pkgconfig",  "1.0.0"
# github "ruby",       "8.1.7"
# github "stdlib",     "4.2.1",  :repo => "puppetlabs/puppetlabs-stdlib"
# github "sudo",       "1.0.0"
# github "vagrant",    "3.1.1"
# github "virtualbox", "1.0.13"
# github "xquartz",    "1.2.1"
# 
# github "postgresql", "3.0.1"
# mod    "mloberg/python",
#   :git => "git://github.com/mloberg/puppet-python.git",
#   :ref => "8cb6d99aad9faed6c57f4ead728a020ebf038ddf"
# mod    "jwmayfield/repository",
#   :git => "git://github.com/jwmayfield/puppet-repository.git",
#   :ref => "516c4c659ec59fe046fddd0138b09486c7cf4f3b"
# github "sysctl",     "1.0.1"
# github "zeromq",     "1.0.0"
# 
# # Optional/custom modules. There are tons available at
# # https://github.com/boxen.
# 
# mod    "zroger/autoenv",
#   :git => "git://github.com/zroger/puppet-autoenv.git",
#   :ref => "86a415d24f330cf996a84c010fe95fa28eaaf41b"
# github "chrome",     "1.1.2"
# github "dropbox",    "1.2.0"
# github "firefox",    "1.2.1"
# github "foreman",    "1.2.0"
# github "geoip",      "1.0.0"
# github "heroku",     "2.1.1"
# github "hipchat",    "1.1.3"
# github "iterm2",     "1.1.2"
# github "lastpass",   "1.1.0",
#   :repo => "dieterdemeyer/puppet-lastpass"
# github "msrdc",      "0.0.3",
#   :repo => "jwmayfield/puppet-msrdc"
# github "mysql",      "1.2.1"
# github "property_list_key", "0.1.0",
#   :repo => "glarizza/puppet-property_list_key"
# github "osx",        "2.7.0"
# github "rdio",       "1.0.0"
# github "skype",      "1.0.8"
# github "sourcetree", "1.0.0"
# github "tmux",       "1.0.2"
# mod    "jwmayfield/vim",
#   :git => "git://github.com/jwmayfield/puppet-vim.git",
#   :ref => "22b1e1869bdae89cdc60660ebf570ffb60b3a6a1"
# github "wget",       "1.0.1"
# github "zsh",        "1.0.0"
