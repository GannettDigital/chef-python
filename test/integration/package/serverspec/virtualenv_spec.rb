require_relative 'spec_helper'

pip_binary = '/usr/bin/pip'

describe command("#{pip_binary} show virtualenv") do
  its(:stdout) { should contain('Name: virtualenv') }
end