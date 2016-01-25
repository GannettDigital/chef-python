require_relative 'spec_helper'

#Should install dependant packages
describe package('python27') do
  it { should be_installed }
end

if os[:family] == 'redhat'
  describe package('python27-devel') do
    it { should be_installed }
  end
else
  describe package('python-dev') do
    it { should be_installed }
  end
end
