#
# Cookbook Name:: hello_world
# Recipe:: default
#
# Copyright (C) 2016 SpinDance, Inc.
#
# All rights reserved - Do Not Redistribute
#

# Will create install nginx, configure nginx, copy out website, install ntp

include_recipe 'nginx'

package 'ntp' do
  action :install
end

package 'git' do
  action :install
end

ssh_known_hosts_entry 'github.com'

directory '/var/www/' do
  owner 'nginx'
  group 'nginx'
  mode 00755
  recursive true
  action :create
end

cookbook_file '/etc/nginx/sites-available/hello_world' do
  source 'hello_world'
  owner 'root'
  group 'root'
  mode 00644
end

application '/var/www/hello_world' do
  git do
    repository 'https://github.com/spindance-ops/hello_world_site.git'
  end
end

nginx_site 'hello_world'

nginx_site 'default' do
  enable false
end

file '/etc/nginx/conf.d/default.conf' do
  action :delete
end

service 'nginx' do
  action :restart
end
