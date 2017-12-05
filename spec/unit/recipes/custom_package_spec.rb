# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'fauxhai'

describe 'python::custom-package' do
  context 'When all attributes are default, on CentOS 7.4' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '7.4.1708') do |node|
        node.set['python']['install_method'] = 'custom-package'
      end.converge(described_recipe)
    end

    it 'includes yum-gd' do
      expect(chef_run).to include_recipe('yum-gd')
    end

    it 'installs python27' do
      expect(chef_run).to install_package('python27')
    end

    it 'installs python-devel' do
      expect(chef_run).to install_package('python27-devel')
    end 
  end
end
