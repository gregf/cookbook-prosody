#
# Cookbook Name:: prosody
# Attributes:: default
#
# Copyright 2013, Greg Fitzgerald.
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
#

default['prosody']['use_libevent'] = true
default['prosody']['allow_registration'] = false
default['prosody']['c2s_require_encryption'] = true
default['prosody']['s2s_secure_auth'] = true
default['prosody']['s2s_insecure_domains'] = %w[]
default['prosody']['s2s_secure_domains'] = %w[]
default['prosody']['authentication'] = "internal_plain"
default['prosody']['package'] = 'prosody-0.9'
default['prosody']['libevent_package'] = 'liblua5.1-event0'
default['prosody']['luasec_package'] = 'lua-sec-prosody'
default['prosody']['storage'] = 'internal'
default['prosody']['conf_dir'] = '/etc/prosody'
default['prosody']['conf_file'] = ::File.join(node['prosody']['conf_dir'], 'prosody.cfg.lua')
default['prosody']['vhosts_dir'] = ::File.join(node['prosody']['conf_dir'], 'vhosts.d')
default['prosody']['ssl_dir'] = ::File.join(node['prosody']['conf_dir'], 'certs')
default['prosody']['pidfile'] = '/var/run/prosody/prosody.pid'

# For more information http://prosody.im/doc/modules
default['prosody']['modules_enabled'] = [
  # Generally required
  "roster", # Allow users to have a roster. Recommended ,)
  "saslauth", # Authentication for clients and servers. Recommended if you want to log in.
  "tls", # Add support for secure TLS on c2s/s2s connections
  "dialback", # s2s dialback support
  "disco", # Service discovery

  # Not essential, but recommended
  "private", # Private XML storage (for room bookmarks, etc.)
  "vcard", # Allow users to set vCards

  # Nice to have
  "version", # Replies to server version requests
  "ping", # XMPP Ping
  "uptime", # Uptime reporting
  "time", # Let others know the time here
  "register", # Allow users to register on this server using a client
  "admin_adhoc", # Allow you to control XMPP servers and clients over XMPP

  # Other specific functionality
  "pep", # PEP support (tune, mood, actvity, ..)
  "posix", # POSIX functionality, sends server to background, enables syslog, etc.
  #"console", # telnet to port 5582 (needs console_enabled = true)
  #"bosh", # Enable BOSH clients, aka "Jabber over HTTP"
  #"httpserver", # Serve static files from a directory over HTTP
]

# Rest of the -subj values are defaulted to your vhost
default['ssl']['country'] = "NL"
default['ssl']['state'] = "NH"
default['ssl']['city'] = "AMS"
