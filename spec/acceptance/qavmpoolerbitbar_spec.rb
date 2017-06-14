require 'spec_helper_acceptance'

qa_username='vagrant'

describe "qavmpoolerbitbar" do
  context 'is installed' do
    it "Bitbar" do
        on default, "ls '/Applications/Bitbar.app'", :acceptable_exit_codes => [0]
    end
    it "Plugin" do
      command = "ls /Users/#{qa_username}/plugins/vmpooler-bitbar.30s.rb"
      on default, "sudo -u #{qa_username} -i #{command}", :acceptable_exit_codes => [0]
    end
  end
end