require_relative 'spec_helper'

if os[:family] == 'redhat'
  describe package('openssl-devel') do
    it { should be_installed }
  end

  describe package('bzip2-devel') do
    it { should be_installed }
  end

  describe package('zlib-devel') do
    it { should be_installed }
  end

  describe package('expat-devel') do
    it { should be_installed }
  end

  describe package('db4-devel') do
    it { should be_installed }
  end

  describe package('sqlite-devel') do
    it { should be_installed }
  end

  describe package('ncurses-devel') do
    it { should be_installed }
  end

  describe package('readline-devel') do
    it { should be_installed }
  end

else

  describe package('libssl-dev') do
    it { should be_installed }
  end

  describe package('libbz2-dev') do
    it { should be_installed }
  end

  describe package('zlib1g-dev') do
    it { should be_installed }
  end

  describe package('libexpat1-dev') do
    it { should be_installed }
  end

  describe package('libdb-dev') do
    it { should be_installed }
  end

  describe package('libsqlite3-dev') do
    it { should be_installed }
  end

  describe package('libncursesw5-dev') do
    it { should be_installed }
  end

  describe package('libncurses5-dev') do
    it { should be_installed }
  end

  describe package('libreadline-dev') do
    it { should be_installed }
  end

  describe package('libsasl2-dev') do
    it { should be_installed }
  end

  describe package('libgdbm-dev') do
    it { should be_installed }
  end

end

describe file('/usr/local/bin/python') do
  it { should be_executable }
  it { should_not be_linked_to '/usr/local/bin/python27' }
end

describe command('/usr/local/bin/python --version') do
  its(:stderr) { should contain('Python 2.7.9') }
  its(:exit_status) { should eq 0 }
end