#
# Cookbook Name:: database_sl
# Recipe:: postgresql
#
# Copyright 2015, David Saenz Tagarro
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'database_sl::system_requirements'

postgresql_package_version = node['database']['postgresql']['package_version']
postgresql_version = node['database']['postgresql']['version']

# wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
remote_file 'adding_postgresql_media_key' do
  path "#{Chef::Config[:file_cache_path]}/ACCC4CF8.asc"
  source 'https://www.postgresql.org/media/keys/ACCC4CF8.asc'
end

execute 'adding_apt_repository' do
  user 'root'
  command <<-EOF
    sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
    sudo apt-key add "#{Chef::Config[:file_cache_path]}/ACCC4CF8.asc"
    sudo apt-get -y update
  EOF
  not_if "sudo apt-key list | grep \"PostgreSQL Debian Repository\""
end

package 'specifying db server' do
  package_name %w(postgresql
                  postgresql-contrib)
  version postgresql_package_version
end

package 'specifying db client' do
  package_name 'postgresql-client'
  version postgresql_package_version
end

# Installs postgreSQL dev package with header of PostgreSQL
package 'specifying pg gem dependencies' do
  package_name %w(libpq-dev build-essential)
end

# update config
cookbook_file "/etc/postgresql/#{postgresql_version}/main/pg_hba.conf" do
  group 'postgres'
  source 'pg_hba_trust_local.conf'
  user 'postgres'
end

service 'postgresql' do
  action :restart
end
