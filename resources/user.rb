resource_name :postgresql_user

property :name, String
property :password, String
property :connection, Hash, default: {}

def default_connection
  { hostname: 'localhost', port: 5432, user: 'postgres' }
end

# Connection options:
#   -h, --host=HOSTNAME      database server host or socket directory (default: "/var/run/postgresql")
#   -p, --port=PORT          database server port (default: "5432")
#   -U, --username=USERNAME  database user name (default: "vagrant")
#   -w, --no-password        never prompt for password
#   -W, --password           force password prompt (should happen automatically)
def connection_options
  conn = default_connection.merge(connection)
  "-h #{conn[:hostname]} -p #{conn[:port]} -U #{conn[:user]} -w"
end

action :create do
  # Chef::Log.info("postgresql_user[#{resource_name}]")

  query = "CREATE ROLE #{name || resource_name} " \
          "WITH LOGIN PASSWORD '#{password}';"

  execute 'psql_command' do
    command "psql #{connection_options} --command \"#{query}\""
  end
end
