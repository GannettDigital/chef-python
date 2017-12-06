# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'fauxhai'

describe 'python::pip' do
  context 'When all attributes are default, on CentOS 7.4' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '7.4.1708') do |node|
        stub_command("/usr/bin/python -c 'import setuptools'").and_return(true)
        stub_command("/usr/bin/python get-pip-py").and_return(true)
        stub_command("/usr/local/bin/python2.7 get-pip-py").and_return(true)
        Chef::Config[:file_cache_path] = '/var/chef/cache'
      end.converge(described_recipe)
    end

    it 'creates get-pip.py in the Chef file_cache_path with mode 644' do
      expect(chef_run).to create_cookbook_file(File.join(Chef::Config[:file_cache_path], 'get-pip.py')).with(
        :mode => '0644'
      )
    end

    it 'executes get-pip.py to install pip' do
      expect(chef_run).to run_execute("install-pip") 
    end

    it 'installs setuptools' do
      expect(chef_run).to upgrade_python_pip('setuptools')
    end
  end
end




