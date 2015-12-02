#
# Cookbook Name:: database_sl
# Recipe:: postgresql
#
# Copyright 2015, David Saenz Tagarro
#
# All rights reserved - Do Not Redistribute
#

execute 'system-locales' do
  command <<-EOH
    locale-gen en_US.UTF-8
    update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
  EOH
end

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

# db server
version = node['database_sl']['postgresql']['version']

package %W(postgresql-#{version}
           postgresql-contrib-#{version}
           postgresql-server-dev-#{version})

# db client
package "postgresql-client-#{version}"

# Installs postgreSQL dev package with header of PostgreSQL
# Required to install 'pg' gem
package %w(libpq-dev build-essential)

# update config
cookbook_file "/etc/postgresql/#{version}/main/pg_hba.conf" do
  group 'postgres'
  source 'pg_hba_trust_local.conf'
  user 'postgres'
end

service 'postgresql' do
  action :restart
end
