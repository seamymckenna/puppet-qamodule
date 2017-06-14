class qavmfloaty::config inherits qavmfloaty {
    $user_home_dir = "$qavmfloaty::home_dir/$user/"

    file { $user_home_dir:
      ensure => directory,
      before => File["$user_home_dir$qavmfloaty::config_file"],
    }
  
    file { "$user_home_dir$qavmfloaty::config_file":
      ensure  => file,
      owner   => "$user",
      group   => "$group",
      mode    => '0644',
      before  => File_line['vmfloaty_conf_url'],
    }

    file_line { 'vmfloaty_conf_url':
      ensure => present,
      path   => "$user_home_dir$qavmfloaty::config_file",
      line   => "url: $qavmfloaty::vmpooler_url",
      match  => '^url: ',
    }

    file { "$user_home_dir/scripts/generate_floaty_token.sh":
      ensure  => file,
      owner   => "$user",
      group   => "$group",
      mode    => '0744',
      source  => 'puppet:///modules/qavmfloaty/generate_floaty.sh',
      require => File_line['vmfloaty_conf_url'],
    }
}
