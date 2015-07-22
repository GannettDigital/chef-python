require_relative 'spec_helper'

if ['rhel', 'fedora', 'redhat'].include?(os[:family])
  pip_binary = '/usr/bin/pip'
elsif os[:family] == 'smartos'
  pip_binary = '/opt/local/bin/pip'
else
  pip_binary = '/usr/local/bin/pip'
end

describe command("#{pip_binary} show virtualenv") do
  its(:stdout) { should contain('Name: virtualenv') }
  its(:stdout) { should contain('Version: 13.1.0') }
end