require_relative 'spec_helper'

describe file('/usr/local/bin/pip') do
  it { should be_file }
  it { should be_executable }
end

describe command('/usr/local/bin/pip show setuptools') do
  its(:stdout) { should contain('Name: setuptools') }
  its(:stdout) { should contain('Version: 18.0.1') }
end

describe command('/usr/local/bin/pip show pip') do
  its(:stdout) { should contain('Name: pip') }
  its(:stdout) { should contain('Version: 7.1.0') }
end
