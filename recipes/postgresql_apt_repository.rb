#
# Cookbook Name:: database_sl
# Recipe:: postgresql_apt_repository
#
# Copyright 2015, David Saenz Tagarro
#
# All rights reserved - Do Not Redistribute
#

repository_version = node['database']['postgresql']['repository_version']

tmp_media_key_path = "#{Chef::Config[:file_cache_path]}/ACCC4CF8.asc"

# wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
remote_file 'adding_postgresql_media_key' do
  path tmp_media_key_path
  source 'https://www.postgresql.org/media/keys/ACCC4CF8.asc'
  not_if { ::File.exist? tmp_media_key_path }
end

execute 'adding_postgresql_apt_repository' do
  user 'root'
  command <<-EOF
    sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
    sudo apt-key add "#{tmp_media_key_path}"
    sudo apt-get -y update
  EOF
  not_if "sudo apt-key list | grep \"PostgreSQL Debian Repository\""
end

package 'specifying db server' do
  package_name %w(postgresql
                  postgresql-contrib)
  version repository_version
end

package 'specifying db client' do
  package_name 'postgresql-client'
  version repository_version
end
