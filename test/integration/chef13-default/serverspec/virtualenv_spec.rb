require_relative 'spec_helper'

describe command('/usr/local/bin/pip show virtualenv') do
  its(:stdout) { should contain('Name: virtualenv') }
  its(:stdout) { should contain('Version: 13.1.0') }
end

describe file('/tmp/testenv') do
  it { should be_directory }
end

describe file('/tmp/testenv/bin/activate') do
  it { should be_file }
  its(:content) { should match(/PYTHONHOME/) }
end
