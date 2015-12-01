resource_name :postgresql_user

property :name, String
property :password, String
property :connection, Psql::Connection, default: Psql::Connection.new

action :create do
  user_name = name || resource_name
  query = "CREATE ROLE #{user_name} " \
          "WITH LOGIN PASSWORD '#{password}';"

  execute 'psql_command' do
    command Psql::Command.new(connection, query).to_s
  end
end
