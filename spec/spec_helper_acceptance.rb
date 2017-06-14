#! /usr/bin/env ruby -S rspec
require 'beaker-rspec'
require 'beaker/puppet_install_helper'

UNSUPPORTED_PLATFORMS = []

install_puppet_agent_on(default)

RSpec.configure do |c|
  # Readable test descriptions
  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
      facts = <<-FACTS
---
qa_username: vagrant
qa_puppetize:
  enabled: true
  qaxcode: false
  qahomebrew: true
  qapackages: true
  qarubyecosystem: true
  qavmpoolerbitbar: true
  qabash: true
  qavmfloaty: true
...
FACTS
    create_remote_file(default, '/opt/puppetlabs/facter/facts.d/qa_puppetize.yaml', facts, opts = {})
    module_root = File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
    modules_to_copy = %w(gnupg qabashprofile homebrew qahomebrew qapackages qarubyecosystem qavmpoolerbitbar qaxcode  rvm software qamodule vcsrepo qavmfloaty stdlib)
    modules_to_copy.each do |mod_name|
      copy_module_to(hosts, :source => File.join(module_root, mod_name), :module_name => mod_name)
    end
  end
end
