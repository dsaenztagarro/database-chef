#
# Cookbook Name:: database_sl
# Recipe:: postgresql_distribution
#
# Copyright 2015, David Saenz Tagarro
#
# All rights reserved - Do Not Redistribute
#

version = node['database']['postgresql']['version']

package 'specifying db server' do
  package_name %W(postgresql-#{version}
                  postgresql-contrib-#{version})
end

package 'specifying db client' do
  package_name "postgresql-client-#{version}"
end
