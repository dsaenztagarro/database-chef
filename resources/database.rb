resource_name :postgresql_database

property :name, String
property :owner, String

action :create do
  db_name = name || resource_name
  query = "CREATE DATABASE #{db_name} " \
          "WITH OWNER '#{owner}';"

  execute 'psql_command' do
    command "psql #{connection_options} --command \"#{query}\""
  end
end

