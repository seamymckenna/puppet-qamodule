require 'spec_helper_acceptance'

describe 'custom fact' do
  context 'setting a user' do
    # Using puppet_apply as a helper
    it 'should work idempotently with no errors' do
      pp = <<-EOS
      if $facts['qa_username'] != 'vagrant' {
        err("$qa_username is not the correct 'qa_username' value")
      }
      debug("qa_username value: $qa_username")
      EOS

      apply_manifest(pp, :catch_failures => true)
    end
  end
end
