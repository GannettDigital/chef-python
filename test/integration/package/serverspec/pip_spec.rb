require_relative 'spec_helper'

if ['rhel', 'fedora', 'redhat'].include?(os[:family])
  pip_binary = '/usr/bin/pip'
elsif os[:family] == 'smartos'
  pip_binary = '/opt/local/bin/pip'
else
  pip_binary = '/usr/local/bin/pip'
end

describe file("#{pip_binary}") do
  it { should be_file }
  it { should be_executable }
end

describe command("#{pip_binary} show setuptools") do
  its(:stdout) { should contain('Name: setuptools') }
  its(:stdout) { should contain('Version: 18.0.1') }
end

describe command("#{pip_binary} show pip") do
  its(:stdout) { should contain('Name: pip') }
  its(:stdout) { should contain('Version: 7.1.2') }
end
