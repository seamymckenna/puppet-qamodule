class qamodule::qavmpoolerbitbar (
  String $user = $qa_username,
  String $group = 'staff'
) {

  require qarubyecosystem

  package { ['bitbar']:
    ensure   => present,
    provider => brewcask,
  } -> file { "/Users/$user/repos":
    ensure => directory,
    owner => $user,
    group => $group
  } ->
  vcsrepo { "/Users/$user/repos/vmpooler-bitbar":
    ensure   => present,
    provider => git,
    source   => "https://github.com/johnmccabe/vmpooler-bitbar",
  } ->
  file { "/Users/$user/plugins":
    ensure => directory,
    owner => $user,
    group => $group
  } ->
  exec { 'config_bit_bar_plugins_folder':
    path    => ['/bin','/usr/sbin/','/usr/bin/'],
    command => "defaults write /Applications/BitBar.app pluginsDirectory /Users/$user/plugins",
    unless => "ls /Users/$user/repos/vmpooler-bitbar/ | grep vmpooler-bitbar.30s.rb"
  } ->
  file { "/Users/$user/plugins/vmpooler-bitbar.30s.rb":
    ensure => 'link',
    target => "/Users/$user/repos/vmpooler-bitbar/vmpooler-bitbar.30s.rb",
    owner => $user,
    group => $group
  }
}
