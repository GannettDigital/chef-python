#
# Author:: Seth Chisamore <schisamo@opscode.com>
# Cookbook Name:: python
# Recipe:: pip
#
# Copyright 2011, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Where does pip get installed?
# platform/method: path (proof)
# redhat/package: /usr/bin/pip (sha a8a3a3)
# omnibus/source: /opt/local/bin/pip (sha 29ce9874)

pip_binary = if node['python']['install_method'] == 'source'
               "#{node['python']['prefix_dir']}/bin/pip"
             elsif platform_family?('rhel', 'fedora')
               '/usr/bin/pip'
             elsif platform_family?('smartos')
               '/opt/local/bin/pip'
             else
               '/usr/local/bin/pip'
             end

cookbook_file "#{Chef::Config[:file_cache_path]}/get-pip.py" do
  source 'get-pip.py'
  mode '0644'
  not_if { ::File.exist?(pip_binary) }
end

execute 'install-pip' do
  cwd Chef::Config[:file_cache_path]
  if node['python']['install_method'] == 'custom-package'
    command <<-EOF
    #{node['python']['custom_binary']} get-pip.py --no-setuptools pip==#{node['python']['pip']['version']}
    EOF
  else
    command <<-EOF
    #{node['python']['binary']} get-pip.py --no-setuptools pip==#{node['python']['pip']['version']}
    EOF
  end
  not_if { ::File.exist?(pip_binary) }
end

python_pip 'setuptools' do
  action :upgrade
  version node['python']['setuptools_version']
end
