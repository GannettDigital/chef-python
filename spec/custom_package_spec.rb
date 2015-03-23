# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'fauxhai'

describe 'python::custom-package' do
  let(:chef_run) { ChefSpec::SoloRunner.new }

  before do
    chef_run.node.set['python']['install_method'] = 'custom-package'
  end


  it 'installs python27' do
    chef_run.converge(described_recipe)
    expect(chef_run).to install_package('python27')
  end

  it 'installs python-devel' do
    chef_run.converge(described_recipe)
    expect(chef_run).to install_package('python27-devel')
  end

  it 'installs python27alt' do
    chef_run.node.set['platform'] = 'amazon'
    chef_run.converge(described_recipe)
    expect(chef_run).to install_package('python27')
  end

  it 'installs pythonalt-devel' do
    chef_run.node.set['platform'] = 'amazon'
    chef_run.converge(described_recipe)
    expect(chef_run).to install_package('python27-devel')
  end
end
