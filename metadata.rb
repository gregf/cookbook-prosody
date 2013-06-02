name             'prosody'
maintainer       'Greg Fitzgerald'
maintainer_email 'greg@gregf.org'
license          'Apache 2.0'
description      'Installs/Configures prosody'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w{ apt }.each do |dep|
  depends dep
end

%w{ debian ubuntu centos }.each do |os|
  supports os
end
