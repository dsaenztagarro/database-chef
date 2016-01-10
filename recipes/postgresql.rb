#
# Cookbook Name:: database_sl
# Recipe:: postgresql_server
#
# Copyright 2015, David Saenz Tagarro
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'database_sl::system_requirements'

origin = node['database']['postgresql']['origin']
version = node['database']['postgresql']['version']

include_recipe "database_sl::postgresql_#{origin}"

# Installs postgreSQL dev package with header of PostgreSQL
package 'specifying pg gem dependencies' do
  package_name %w(libpq-dev build-essential)
end

# update config
cookbook_file "/etc/postgresql/#{version}/main/pg_hba.conf" do
  group 'postgres'
  source 'pg_hba_trust_local.conf'
  user 'postgres'
end

service 'postgresql' do
  action [:restart, :reload]
end
