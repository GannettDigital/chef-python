# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'fauxhai'

describe 'python::package' do
  context 'When all attributes are default, on CentOS 7.4' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '7.4.1708') do |node|
        stub_command("/usr/bin/python -c 'import setuptools'").and_return(true)
      end.converge(described_recipe)
    end

    it 'installs python' do
      expect(chef_run).to install_package('python')
    end

    it 'installs python-devel' do
      expect(chef_run).to install_package('python-devel')
    end
  end
end
