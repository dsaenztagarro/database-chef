#
# Cookbook Name:: database_sl
# Recipe:: system_requirements
#
# Copyright 2015, David Saenz Tagarro
#
# All rights reserved - Do Not Redistribute
#

execute 'system_locales' do
  command <<-EOH
    locale-gen en_US.UTF-8
    update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
  EOH
end

package ['wget', 'ca-certificates']
