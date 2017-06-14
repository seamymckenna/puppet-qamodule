class qamodule::qapackages {
  #require qarubyecosystem
  #Following packages are installed via homebrew module
  package {['git', 'tmux', 'gnupg']:
    ensure   => installed,
    provider => brew
  } 
  #Following packages are installed via software module
  include software::browsers::chrome
  include software::virtualization::virtualbox
}
