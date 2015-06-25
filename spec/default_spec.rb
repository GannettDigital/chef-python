# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'fauxhai'

describe 'python::default' do
  let :chef_run do
    ChefSpec::SoloRunner.new(file_cache_path: '/var/chef/cache').converge(described_recipe)
  end

  before do
    stub_command("/usr/bin/python -c 'import setuptools'").and_return(true)
  end

  it 'includes python::custom-package by default' do
    chef_run.converge(described_recipe)
    expect(chef_run).to include_recipe('python::custom-package')
  end

  it 'includes python::pip' do
    chef_run.converge(described_recipe)
    expect(chef_run).to include_recipe('python::pip')
  end

  it 'includes python::virtualenv' do
    chef_run.converge(described_recipe)
    expect(chef_run).to include_recipe('python::virtualenv')
  end
end
