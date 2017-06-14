require 'spec_helper'

describe 'qabashprofile' do
  context 'with default values for all parameters' do
    it { should contain_class('qabashprofile') }
  end
end

describe 'qahomebrew' do
  context 'with default values for all parameters' do
    it { should contain_class('qahomebrew') }
  end
end

describe 'qapackages' do
  context 'with default values for all parameters' do
    it { should contain_class('qapackages') }
  end
end

describe 'qavmfloaty' do
  context 'with default values for all parameters' do
    it { should contain_class('qavmfloaty') }
  end
end

describe 'qavmpoolerbitbar' do
  context 'with default values for all parameters' do
    it { should contain_class('qavmpoolerbitbar') }
  end
end

describe 'qarubyecosystem' do
  context 'with default values for all parameters' do
    it { should contain_class('qarubyecosystem') }
  end
end

describe 'qaxcode' do
  context 'with default values for all parameters' do
    it { should contain_class('qaxcode') }
  end
end