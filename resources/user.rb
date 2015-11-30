resource_name :postgresql_user

property :name, String
property :password, String
property :connection, Hash, default: {}

action :create do
  # Chef::Log.info("postgresql_user[#{resource_name}]")

  query = "CREATE ROLE #{name || resource_name} " \
          "WITH LOGIN PASSWORD '#{password}';"

  execute 'psql_command' do
    command "psql #{connection_options} --command \"#{query}\""
  end
end
