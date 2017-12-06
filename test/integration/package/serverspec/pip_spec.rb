require_relative 'spec_helper'

pip_binary = '/usr/bin/pip'

describe file("#{pip_binary}") do
  it { should be_file }
  it { should be_executable }
end

describe command("#{pip_binary} show setuptools") do
  its(:stdout) { should contain('Name: setuptools') }
end

describe command("#{pip_binary} show pip") do
  its(:stdout) { should contain('Name: pip') }
  its(:stdout) { should contain('Version: 7.1.2') }
end
