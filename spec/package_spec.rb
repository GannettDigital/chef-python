# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'fauxhai'

describe 'python::package' do
  let :chef_run do
    ChefSpec::SoloRunner.converge(described_recipe)
  end

  before do
    stub_command("/usr/bin/python -c 'import setuptools'").and_return(true)
  end

  it 'installs python' do
    chef_run.converge(described_recipe)
    expect(chef_run).to install_package('python')
  end

  it 'installs python-devel' do
    chef_run.converge(described_recipe)
    expect(chef_run).to install_package('python-devel')
  end

end
