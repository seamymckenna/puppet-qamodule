class qamodule::qavmfloaty::install inherits qamodule::qavmfloaty {
  package { 'vmfloaty':
    ensure   => $qavmfloaty::package_ensure,
    provider => 'gem',
  }
}
