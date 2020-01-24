require_relative 'spec_helper'

describe file('/etc/yum.repos.d/gdcustom.repo') do
  it { should be_file }
end

#Should install dependant packages
describe package('python27') do
  it { should be_installed }
end

describe package('python27-devel') do
  it { should be_installed }
end
