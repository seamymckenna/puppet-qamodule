require 'spec_helper_acceptance'

qa_username='vagrant'

describe "qapackages" do
  context 'is installed' do
    it "Google Chrome" do
      on default, "ls '/Applications/Google Chrome.app'", :acceptable_exit_codes => [0]
    end
    it "VirtualBox" do
      on default, "ls '/Applications/VirtualBox.app'", :acceptable_exit_codes => [0]
    end
    it "Git" do
      on default, "sudo -u #{qa_username} -i which git", :acceptable_exit_codes => [0]
    end
    it "Tmux" do
      on default, "sudo -u #{qa_username} -i which tmux", :acceptable_exit_codes => [0]
    end
    it "Gnupg" do
      on default, "sudo -u #{qa_username} -i which gpg", :acceptable_exit_codes => [0]
    end
  end
end