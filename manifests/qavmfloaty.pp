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
  String $config_file,
  String $config_file_mode,
  String $config_template,
  String $package_ensure,
  String $package_name,
  String $vmpooler_url,
  String $home_dir,
  String $user = $qa_username,
  String $group = 'staff'
) {
  contain qamodule::qavmfloaty::install
  contain qamodule::qavmfloaty::config

  Class['::qavmfloaty::install'] ->
  Class['::qavmfloaty::config']
}
