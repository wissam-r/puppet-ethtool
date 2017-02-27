require 'spec_helper'
describe 'ethtool' do
  context 'with default values for all parameters' do
    it { should contain_class('ethtool') }
  end
end
