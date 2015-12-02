#
# Cookbook Name:: database_sl
# Recipe:: postgresql
#
# Copyright 2015, David Saenz Tagarro
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'database_sl::system_requirements'

execute 'adding_apt_repository' do
  user 'root'
  command <<-EOF
    sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
    apt-get -y update
  EOF
  not_if 'grep -q http://apt.postgresql.org/pub/repos/apt/ /etc/apt/sources.list.d/pgdg.list'
end

version = node['database_sl']['postgresql']['version']
postgresql_version = node['database_sl']['postgresql']['version']

package 'specifying db server' do
  package_name %W(postgresql
                  postgresql-contrib
                  postgresql-server-dev)
  version postgresql_version
end

package 'specifying db client' do
  package_name 'postgresql-client'
  version postgresql_version
end

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
  action :restart
end
