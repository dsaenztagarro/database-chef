resource_name :postgresql_user

property :instance_name, String, name_property: true
property :password, String
property :connection, Psql::Connection, default: Psql::Connection.new

# grant action properties
#
property :privileges, Array, default: []
property :database_name, String

action :create do
  query = "CREATE ROLE #{name} " \
          "WITH LOGIN PASSWORD '#{password}';"

  execute 'psql_command' do
    command psql_builder.build(query)
  end
end

action :grant do
  access_privileges = privileges.join ' '

  query = "GRANT #{access_privileges} " \
          "ON DATABASE #{database_name} " \
          "TO #{name};"

  execute 'psql_command' do
    command psql_builder.build(query)
  end
end
