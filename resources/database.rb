resource_name :postgresql_database

default_action :create

property :instance_name, String, name_property: true
property :name, String
property :owner, String, default: 'postgres'
property :connection, Psql::Connection, default: Psql::Connection.new

action :create do
  query = "CREATE DATABASE #{name} " \
          "OWNER #{owner};"

  search_query = "SELECT * FROM pg_database WHERE datname = '#{name}';"
  exists = search_command_for(search_query)

  execute 'psql_command' do
    command psql_for(query)
    not_if exists
  end
end
