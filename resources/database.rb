resource_name :postgresql_database

property :name, String
property :owner, String
property :connection, Psql::Connection, default: Psql::Connection.new

action :create do
  db_name = name || resource_name
  query = "CREATE DATABASE #{db_name} " \
          "OWNER #{owner};"

  execute 'psql_command' do
    command Psql::Command.new(connection, query).to_s
  end
end
