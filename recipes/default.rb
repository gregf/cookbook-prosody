#
# Cookbook Name:: prosody
# Recipe:: default
#
# Copyright 2013, Greg Fitzgerald
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

include_recipe 'apt'

# add the prosody repo and grab key from keyserver
apt_repository 'prosody.im' do
  uri 'http://packages.prosody.im/debian'
  distribution node['lsb']['codename']
  components ['main']
  key 'http://prosody.im/files/prosody-debian-packages.key'
end

package node['prosody']['luasec_package'] if node['prosody']['s2s_secure_auth']
package node['prosody']['libevent_package'] if node['prosody']['use_libevent']

package node['prosody']['package'] do
  action :install
end

directory node['prosody']['vhosts_dir'] do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory node['prosody']['ssl_dir'] do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

template node['prosody']['conf_file'] do
  source 'prosody.cfg.lua.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

service 'prosody' do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
  subscribes  :reload, resources('template[/etc/prosody/prosody.cfg.lua]'),
              :immediately
end
