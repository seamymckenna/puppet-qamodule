class qamodule::qabashprofile (
  String $user = $qamodule::qa_username
) { 
  File { "/Users/$user/.qabashprofile":
    mode => '644',
    source => "puppet:///modules/qamodule/qabashprofile",
  }
  File { "/Users/$user/.profile":
    ensure => file,
  }
  file_line { "source qabashprofile from .profile":
    path => "/Users/$user/.profile",
    line => "source ~/.qabashprofile",
  }
  File { "/Users/$user/.zshrc":
    ensure => file,
  }
  file_line { "source qabashprofile from .zshrc":
  path => "/Users/$user/.zshrc",
  line => "source ~/.qabashprofile",
  }
}
