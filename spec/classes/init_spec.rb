require 'spec_helper'
describe 'archiveplus' do
  context 'with default values for all parameters' do
    it { should contain_class('archiveplus') }
  end
end
