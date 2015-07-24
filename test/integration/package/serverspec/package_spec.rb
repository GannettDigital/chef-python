require_relative 'spec_helper'

#Should install dependant packages
describe package('python') do
  it { should be_installed }
end

if os[:family] == 'redhat'
  describe package('python-devel') do
    it { should be_installed }
  end
else
  describe package('python-dev') do
    it { should be_installed }
  end
end
