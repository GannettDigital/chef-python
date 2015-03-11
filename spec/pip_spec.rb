# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'fauxhai'

describe 'python::pip' do
  let :chef_run do
    ChefSpec::SoloRunner.converge(described_recipe)
  end

  before do
    stub_command("/usr/bin/python -c 'import setuptools'").and_return(true)
    stub_command("/usr/bin/python get-pip-py").and_return(true)
    allow(Chef::Config).to receive(:file_cache_path)
      .and_return("...")
  end

  it 'creates get-pip.py in the Chef temporary path with mode 644' do
    chef_run.converge(described_recipe)
    expect(chef_run).to create_cookbook_file(File.join(Chef::Config[:file_cache_path], 'get-pip.py'))
  end

  it 'executes get-pip.py to install pip' do
    chef_run.converge(described_recipe)
    node_python_attributes = chef_run.node['python']
    expect(chef_run).to run_execute("install-pip") 
    # expect(chef_run).to run_execute("#{node_python_attributes['binary']} get-pip.py")
  end

  it 'installs setuptools' do
    chef_run.converge(described_recipe)
    expect(chef_run).to upgrade_python_pip('setuptools')
  end

end
