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
default['prosody']['storage'] = 'internal'
default['prosody']['vhosts_dir'] = '/etc/prosody/vhosts.d'
default['prosody']['pidfile'] = '/var/run/prosody/prosody.pid'

# For more information http://prosody.im/doc/modules_enabled
default['prosody']['modules_enabled'] = %w[ roster saslauth tls dialback disco
                                            private vcard version uptime time
                                            ping pep register admin_adhoc posix]

