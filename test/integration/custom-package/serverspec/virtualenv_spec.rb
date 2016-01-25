require_relative 'spec_helper'

pip_binary = '/usr/local/bin/pip'

describe command("#{pip_binary} show virtualenv") do
  its(:stdout) { should contain('Name: virtualenv') }
  its(:stdout) { should contain('Version: 13.1.0') }
end
