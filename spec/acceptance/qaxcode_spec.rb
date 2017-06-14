require 'spec_helper_acceptance'

qa_username='vagrant'

describe 'qaxcode' do
  context 'is installed' do
    it 'runs with no errors' do
      on default, "sudo -u #{qa_username} -i xcode-select -v", :acceptable_exit_codes => [0]
    end
  end
end