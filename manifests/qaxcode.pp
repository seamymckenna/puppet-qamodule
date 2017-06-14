class qamodule::qaxcode (
  String $user = $qa_username,
  String $group = 'admin'
) {
  #Create a scripts directory
  file {"/Users/$user/scripts":
    ensure  => directory,
    owner   => $user,
    group   => $group,
  }->
  #Create the install script
  file {"/Users/$user/scripts/install_xcode_cli_tools.sh":
    ensure  => present,
    owner   => $user,
    group   => $group,
    source  => "puppet:///modules/qamodule/install_xcode_cli_tools.sh",
    mode    => '0755',
  } ->
  exec { 'install_xcode_cli_tools':
    path    => ['/Users/$user/scripts','/usr/sbin/','/usr/bin/','/bin/'],
    command => "/Users/$user/scripts/install_xcode_cli_tools.sh",
    creates => '/Library/Developer/CommandLineTools/',
    timeout => 600
 }
}
