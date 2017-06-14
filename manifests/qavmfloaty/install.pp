class qavmfloaty::install inherits qavmfloaty {
  package { 'vmfloaty':
    ensure   => $qavmfloaty::package_ensure,
    provider => 'gem',
  }
}
