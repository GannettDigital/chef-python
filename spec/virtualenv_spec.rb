# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'fauxhai'

describe 'python::virtualenv' do
  let :chef_run do
    ChefSpec::SoloRunner.new(file_cache_path: '/var/chef/cache').converge(described_recipe)
  end

  before do
    stub_command("/usr/bin/python -c 'import setuptools'").and_return(true)
    stub_command("/usr/bin/python get-pip-py").and_return(true)
    stub_command("/usr/local/bin/python2.7 get-pip-py").and_return(true)
  end

  it 'includes python::pip' do
    chef_run.converge(described_recipe)
    expect(chef_run).to include_recipe('python::pip')
  end

  it 'installs virtualenv' do
    chef_run.converge(described_recipe)
    expect(chef_run).to upgrade_python_pip('virtualenv')
  end

end
