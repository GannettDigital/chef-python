# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'fauxhai'

describe 'python::custom-package' do
  let :chef_run do
    ChefSpec::SoloRunner.converge(described_recipe)
  end

  it 'installs python27' do
    chef_run.converge(described_recipe)
    expect(chef_run).to install_package('python27')
  end

  it 'installs python-devel' do
    chef_run.converge(described_recipe)
    expect(chef_run).to install_package('python27-devel')
  end

end
