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
  end
end
