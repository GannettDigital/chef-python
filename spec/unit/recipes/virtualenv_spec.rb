# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'fauxhai'

describe 'python::virtualenv' do
  context 'When all attributes are default, on CentOS 7.4' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '7.4.1708') do |node|
        stub_command("/usr/bin/python -c 'import setuptools'").and_return(true)
        stub_command("/usr/bin/python get-pip-py").and_return(true)
        stub_command("/usr/local/bin/python2.7 get-pip-py").and_return(true)
      end.converge(described_recipe)
    end

    it 'includes python::pip' do
      expect(chef_run).to include_recipe('python::pip')
    end

    it 'installs virtualenv' do
      expect(chef_run).to upgrade_python_pip('virtualenv')
    end
  end
end
