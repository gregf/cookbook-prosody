require 'minitest/spec'
#
## Cookbook Name:: prosody
## Spec:: default

describe_recipe 'prosody::default' do
  it 'ensures prosody is installed' do
    package(node['prosody']['package']).must_be_installed
  end

  it 'ensures a config file is present' do
    file(node['prosody']['conf_file']).must_exist
  end

  it 'ensures prosody is running' do
    service('prosody').must_be_running
  end
end
