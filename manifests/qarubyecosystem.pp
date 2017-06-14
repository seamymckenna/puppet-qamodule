class qamodule::qarubyecosystem (
  String $user = $qa_username
) {
  #require qahomebrew

  class { '::rvm': gnupg_key_id => false}
  rvm::system_user { "$user": }
  ->
    #The installing of ruby via the rvm module uses brew as root which is no longer
    #supported, hence we use exec for the installation of ruby
  exec { 'install_ruby.2.3.1':
    cwd => '/tmp',
    timeout => 0,
    require => Class['::rvm'],
    command => "sudo -u $user rvm install ruby-2.3.1",
    unless => "sudo -u $user rvm list | grep 2.3.1",
    path    => ['/bin','/usr/sbin/','/usr/bin/','/usr/local/rvm/bin/'],
  } ->
  exec { 'default_ruby.2.3.1':
    cwd => '/tmp',
    command => "sudo -u $user rvm alias create default ruby-2.3.1",
    path    => ['/bin','/usr/sbin/','/usr/bin/', '/usr/local/rvm/bin/'],
    unless => "sudo -u $user rvm list | egrep '^(=\*|\*)\s(ruby|jruby|rbx|ree)-[0-9\.]+'",
  } ->
  rvm_gem {
    'vmfloaty':
      name         => 'vmfloaty',
      ruby_version => 'ruby-2.3.1',
      ensure       => latest,
  } ->
  rvm_gem {
    'bundler':
      name         => 'bundler',
      ruby_version => 'ruby-2.3.1',
      ensure       => latest,
  }
}
