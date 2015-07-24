require_relative 'spec_helper'

describe command('/usr/local/bin/pip show virtualenv') do
  its(:stdout) { should contain('Name: virtualenv') }
  its(:stdout) { should contain('Version: 13.1.0') }
end