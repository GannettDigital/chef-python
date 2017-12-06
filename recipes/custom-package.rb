#
# Author:: Jason Neves <jneves@gannett.com>
# Cookbook Name:: python
# Recipe:: custom-package
#
# Copyright 2015
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

# This recipe assumes that you have a custom package repository with
# Python built and named as "python27"

include_recipe 'yum-gd'

python_pkgs = [node['python']['custom_package_name'], "#{node['python']['custom_package_name']}-devel"]

python_pkgs.each do |pkg|
  package pkg do
    version node['python']['version']
    action :install
  end
end
