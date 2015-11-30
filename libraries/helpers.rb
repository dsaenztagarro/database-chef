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
