require 'spec_helper'
describe 'xvfb' do
  context 'with default values for all parameters' do
    it { should contain_class('xvfb') }
  end
end
