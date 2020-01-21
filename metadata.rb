name 'python'
maintainer 'PAAS'
maintainer_email 'paas-integration@gannett.com'
license ' Copyright (c) 2017 Gannett Co., Inc, All Rights Reserved.'
description 'Installs Python, pip and virtualenv. \
            Includes LWRPs for managing Python packages with `pip` and `virtualenv` isolated Python environments.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))

version '2.0.3'

chef_version '>= 12.11.18'

depends 'build-essential'
depends 'yum-epel'
depends 'yum-gd'

source_url 'https://github.com/GannettDigital/chef-python'
issues_url 'https://github.com/GannettDigital/chef-python/issues'

%w(centos).each do |os|
  supports os
end
