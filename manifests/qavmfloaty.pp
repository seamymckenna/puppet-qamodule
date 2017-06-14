# Class: qavmfloaty
# ===========================
#
# Manages the vmfloaty gem
#
# Parameters
# ----------
#
# Document parameters here.
#
#
# Variables
# ----------
#
#
# Examples
# --------
#
#
# Authors
# -------
#
# Andrew Hayes <andrew.hayes@puppet.com>
#
# Copyright
# ---------
#
# Copyright 2016 Puppet Ltd, unless otherwise noted.
#
class qamodule::qavmfloaty (
  String $config_file = '.vmfloaty.yml',
  String $config_file_mode = '0444',
  String $config_template = 'vmfloaty/vmfloaty.yml.epp',
  String $package_ensure = 'present',
  String $package_name = 'vmfloaty',
  String $vmpooler_url = 'http://vmpooler.delivery.puppetlabs.net',
  String $home_dir = '/Users',
  String $user = $qa_username,
  String $group = 'staff'
) {
  contain qamodule::qavmfloaty::install
  contain qamodule::qavmfloaty::config

  Class['qamodule::qavmfloaty::install'] ->
  Class['qamodule::qavmfloaty::config']
}
