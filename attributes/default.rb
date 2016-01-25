#
# Author:: Seth Chisamore (<schisamo@opscode.com>)
# Cookbook Name:: python
# Attribute:: default
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

default['python']['install_method'] = 'custom-package'

if node['python']['install_method'] == 'package'
  default['python']['prefix_dir'] = case platform
                                    when 'smartos'
                                      '/opt/local'
                                    else
                                      '/usr'
                                    end
else
  default['python']['prefix_dir'] = '/usr/local'
end

default['python']['binary'] = "#{node['python']['prefix_dir']}/bin/python"

if node['python']['install_method'] == 'custom-package'
  default['python']['custom_package_name'] = case platform
                                             when 'amazon'
                                               'python27alt'
                                             else
                                               'python27'
                                             end
end

case node['python']['install_method']
when 'custom-package'
  case platform
  when 'amazon'
    default['python']['version'] = '2.7.9-1.amzn1.gd'
  when 'centos', 'redhat'
    default['python']['version'] = if node['platform_version'].to_f >= 7
                                     '2.7.9-1.el7.centos.gd'
                                   else
                                     '2.7.9-1.el6.gd'
                                   end
  end
when 'package'
  case platform
  when 'centos', 'redhat'
    default['python']['version'] = if node['platform_version'].to_f >= 7
                                     '2.7.5-18.el7_1.1'
                                   else
                                     '2.6.6-64.el6'
                                   end
  else
    default['python']['version'] = '2.6.6-64.el6'
  end
when 'source'
  default['python']['version'] = '2.7.9'
end

default['python']['custom_binary'] = "#{node['python']['prefix_dir']}/bin/python2.7"
default['python']['url'] = 'http://www.python.org/ftp/python'
default['python']['checksum'] = 'c8bba33e66ac3201dabdc556f0ea7cfe6ac11946ec32d357c4c6f9b018c12c5b'
default['python']['configure_options'] = %W(--prefix=#{python['prefix_dir']})
default['python']['make_options'] = %w(install)

default['python']['pip_location'] = "#{node['python']['prefix_dir']}/bin/pip"
default['python']['virtualenv_location'] = "#{node['python']['prefix_dir']}/bin/virtualenv"
default['python']['setuptools_version'] = nil # defaults to latest
default['python']['virtualenv_version'] = nil
default['python']['pip']['version'] = '7.1.2'
