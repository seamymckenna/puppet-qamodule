class qamodule::qahomebrew (
  String $user = $qa_username,
  String $group = 'staff'
) {

  require Class['qamodule::qavmfloaty']

  # /usr/local/bin is a virtual resource defined in puppet_enterprise::symlinks
  # We use a resource collecter to realize and update attributes
  File <| title == '/usr/local/bin' |> {
    owner  => $user,
    group  => $group,
    mode  => '0775',
  } ->
  class { 'homebrew':
    user  => $user,
    group => $group,
    command_line_tools_package => 'Command_Line_Tools_macOS_10.12_for_Xcode_8.3.dmg',
    command_line_tools_source  => 'http://10.32.174.232/Command_Line_Tools_macOS_10.12_for_Xcode_8.3.dmg',
  } 
}
