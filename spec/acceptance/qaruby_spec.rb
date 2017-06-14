require 'spec_helper_acceptance'

qa_username='vagrant'

describe 'RVM' do
    it 'is installed' do
      command = 'rvm'
      on default, "sudo -u #{qa_username} -i #{command}", :acceptable_exit_codes => [0]
    end

    it 'ruby 2.3.1 is installed' do
      command = 'rvm list'
      result = on(default, "sudo -u #{qa_username} -i #{command}")
     expect(result.stdout).to contain 'ruby-2.3.1'
    end

    it 'ruby 2.3.1 is set to default' do
      command = 'rvm list'
      result = on(default, "sudo -u #{qa_username} -i #{command}")
      expect(result.stdout).to contain '=* ruby-2.3.1'
    end
end