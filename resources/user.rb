resource_name :postgresql_user

default_action :create

property :instance_name, String, name_property: true
property :name, String
property :password, String
property :connection, Psql::Connection, default: Psql::Connection.new

# grant action properties
#
property :privileges, Array, default: []
property :database_name, String

action :create do
  query = "CREATE ROLE #{name} " \
          "WITH LOGIN PASSWORD '#{password}';"

  search_query = "SELECT * FROM pg_roles WHERE rolname = '#{name}';"
  exists = search_command_for(search_query)

  execute "psql_create_role_#{name}" do
    command psql_for(query)
    not_if exists
  end
end

action :grant do
  query = "GRANT #{privileges.join ' '} " \
          "ON DATABASE #{database_name} " \
          "TO #{name};"

  search_query = "SELECT * FROM pg_roles WHERE rolname = '#{name}';"
  exists = search_command_for(search_query)

  execute "psql_grant_privileges_to_#{name}" do
    command psql_for(query)
    only_if exists
  end
end
