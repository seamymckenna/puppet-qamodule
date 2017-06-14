class qamodule {

  # checks fact is defined and equals true before checking using specified inclusion.
  if $facts['qa_puppetize'] != undef and $facts['qa_puppetize']['enabled'] == true {

    # checks fact is defined and equals true before including qabash module.
    if $facts['qa_puppetize']['qabash'] != undef and $facts['qa_puppetize']['qabash'] == true {
      include qamodule::qabashprofile
    }

    # checks fact is defined and equals true before including qaxcode module.
    if $facts['qa_puppetize']['qaxcode'] != undef and $facts['qa_puppetize']['qaxcode'] == true {
      include qamodule::qaxcode
    }

    # checks fact is defined and equals true before including qahomebrew module.
    if $facts['qa_puppetize']['qahomebrew'] != undef and $facts['qa_puppetize']['qahomebrew'] == true {
      include qamodule::qahomebrew
    }

    # checks fact is defined and equals true before including qapackages module.
    if $facts['qa_puppetize']['qapackages'] != undef and $facts['qa_puppetize']['qapackages'] == true {
      include qamodule::qapackages
    }

    # checks fact is defined and equals true before including qarubyecosystem module.
    if $facts['qa_puppetize']['qarubyecosystem'] != undef and $facts['qa_puppetize']['qarubyecosystem'] == true {
      include qamodule::qarubyecosystem
    }

    # checks fact is defined and equals true before including qavmpoolerbitbar module.
    if $facts['qa_puppetize']['qavmpoolerbitbar'] != undef and $facts['qa_puppetize']['qavmpoolerbitbar'] == true {
      include qamodule::qavmpoolerbitbar
    }

    # checks fact is defined and equals true before including qavmfloaty module.
    if $facts['qa_puppetize']['qavmfloaty'] != undef and $facts['qa_puppetize']['qavmfloaty'] == true {
      include qamodule::qavmfloaty
    }
  }
}

