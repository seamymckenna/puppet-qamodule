class qamodule::qabashprofile (
  String $user = $qa_username
) { 
  File { "/Users/$user/.qabashprofile":
    mode => '644',
    source => "puppet:///modules/qabashprofile/qabashprofile",
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
