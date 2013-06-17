require 'minitest/spec'
#
## Cookbook Name:: prosody
## Spec:: default

describe_recipe 'prosody::default' do
  it 'ensures the apt repository exists' do
    file('/etc/apt/sources.list.d/prosody.im.list').must_exist
  end

  it 'ensures prosody is installed' do
    package(node['prosody']['package']).must_be_installed
  end

  it 'ensures luasec is installed' do
    package(node['prosody']['luasec_package']).must_be_installed
  end

  it 'ensures libevent is installed' do
    package(node['prosody']['libevent_package']).must_be_installed
  end

  it 'ensures a config file is present' do
    file(node['prosody']['conf_file']).must_exist
  end

  it 'ensures the vhosts directory exists and has correct permissions' do
    assert_directory node['prosody']['vhosts_dir'], 'root', 'root', '755'
  end

  it 'ensures the ssl directory exists and has correct permissions' do
    assert_directory node['prosody']['ssl_dir'], 'root', 'root', '755'
  end

  it 'ensures prosody is running' do
    service('prosody').must_be_running
  end
end

class ProsodyLwrp < MiniTest::Chef::Spec
  describe 'prosody lwrp' do
    it 'ensures the virtual host is created' do
      file("#{node['prosody']['vhosts_dir']}/redneck.im.cfg.lua").must_exist.with(:mode, '644')
    end

    it 'ensures ssl is enabled for the virtual host' do
      file("#{node['prosody']['vhosts_dir']}/redneck.im.cfg.lua").must_include('ssl = {')
    end

    it 'ensures the ssl cert is generated for the virtual host' do
      file("#{node['prosody']['ssl_dir']}/redneck.im.crt").must_exist.with(:mode, '644')
      file("#{node['prosody']['ssl_dir']}/redneck.im.key").must_exist.with(:mode, '644')
    end
  end
end
