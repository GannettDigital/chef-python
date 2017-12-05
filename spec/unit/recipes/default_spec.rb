# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'fauxhai'

describe 'python::default' do
  context 'When all attributes are default, on CentOS 7.4' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '7.4.1708') do |node|
        stub_command("/usr/bin/python -c 'import setuptools'").and_return(true)
      end.converge(described_recipe)
    end

    it 'includes python::custom-package by default' do
      expect(chef_run).to include_recipe('python::custom-package')
    end

    it 'includes python::pip' do
      expect(chef_run).to include_recipe('python::pip')
    end

    it 'includes python::virtualenv' do
      expect(chef_run).to include_recipe('python::virtualenv')
    end
  end
end
