#
# Author:: Greg Fitzgerald <greg@gregf.org>
# Cookbook Name:: prosody
# Library:: default 
#
# Copyright 2013, Greg Fitzgerald
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

private

def generate_ssl
  unless File.exist?("#{cert_name}.crt") && File.exist?("#{cert_name}.key")
    Chef::Log.info "Generating vhost for #{vhost}"
    cmd = %Q{openssl req -new -x509 -days 3650 -nodes -sha1 -subj "#{subj}" -out "#{cert_name}.crt" -newkey rsa:2048 -keyout "#{cert_name}.key"}
    Chef::Log.debug(cmd)
    shell_out!(cmd)
  end
end

def remove_ssl
  Chef::Log.info "Removing any existing certs for #{vhost}"
  ::File.delete "#{cert_name}.crt" if ::File.exists?("#{cert_name}.crt")
  ::File.delete "#{cert_name}.key" if ::File.exists?("#{cert_name}.key")
end

def vhost
  new_resource.vhost
end

def vhost_config_file
  ::File.join(node['prosody']['vhosts_dir'], "#{vhost}.cfg.lua")
end

def cert_name
  ::File.join(node['prosody']['ssl_dir'], vhost)
end

def subj
  "/C=#{node[:ssl][:country]}/ST=#{node[:ssl][:state]}/L=#{node[:ssl][:city]}/O=#{vhost}/OU=#{node[:ssl][:depart]}/CN=#{vhost}/emailAddress=root@#{vhost}"
end
