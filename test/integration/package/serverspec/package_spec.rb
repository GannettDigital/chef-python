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

case os[:family]
  when 'redhat' || 'centos' || 'rhel'
    describe command('/usr/bin/python --version') do
      its(:stderr) { should contain('Python 2.6.6') }
      its(:exit_status) { should eq 0 }
    end
  when 'ubuntu'
    describe command('/usr/bin/python --version') do
      case os[:release]
        when '12.04'
          its(:stderr) { should contain('Python 2.7.3') }
        when '10.04'
          its(:stderr) { should contain('Python 2.6.5') }
      end
      its(:exit_status) { should eq 0 }
    end
  else
    describe command('/usr/local/bin/python --version') do
      its(:stderr) { should contain('Python 2.7.9') }
      its(:exit_status) { should eq 0 }
    end
end
