require 'spec_helper_acceptance'

qa_username='vagrant'

describe "qabashprofile" do
  context 'is installed' do
    it "Profile" do
      command = "ls /Users/#{qa_username}/.qabashprofile"
      on default, "sudo -u #{qa_username} -i #{command}", :acceptable_exit_codes => [0]
    end
  end
end