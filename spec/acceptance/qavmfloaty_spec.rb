require 'spec_helper_acceptance'

qa_username='vagrant'

describe 'qahomebrew' do
  context 'is installed' do
    it 'runs with no errors' do
      command = 'floaty list'
      on default, "sudo -u #{qa_username} -i #{command}", :acceptable_exit_codes => [0]
    end
  end
end