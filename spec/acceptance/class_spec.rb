require 'spec_helper_acceptance'

describe 'temporary class' do
  context 'default parameters' do
    # Using puppet_apply as a helper
    it 'should work idempotently with no errors' do
      pp = <<-EOS
      # following file required as part of test
      file { '/usr/local/bin':
        ensure => directory,
        owner  => 'vagrant',
        group  => 'staff',
        mode   => '0775',
      }->
      class { 'qamodule': }
      EOS

      apply_manifest(pp, :accept_all_exit_codes => true)
      apply_manifest(pp, :accept_all_exit_codes => true)
      apply_manifest(pp, :catch_changes => true)

    end
  end
end
