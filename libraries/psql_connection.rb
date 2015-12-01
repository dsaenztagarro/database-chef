# Contains helpers for psql, the PostgreSQL interactive terminal
module Psql
  # Represents psql connection options
  class Connection
    attr_reader :hostname, :port, :user

    # @param [Hash] opts the options to create a connection
    # @option opts [String] :hostname ('localhost') The hostname
    # @option opts [Fixnum] :port (5432) The port
    # @option opts [String] :user ('postgres') The user
    # @option opts [String] :password ('') The password
    def initialize(opts = {})
      @hostname = opts[:hostname] || 'localhost'
      @port = opts[:port] || 5432
      @user = opts[:user] || 'postgres'
      @password = opts[:password] || ''
    end

    # Connection options for psql command:
    #   -h, --host=HOSTNAME      database server host or socket directory (default: "/var/run/postgresql")
    #   -p, --port=PORT          database server port (default: "5432")
    #   -U, --username=USERNAME  database user name (default: "vagrant")
    #   -w, --no-password        never prompt for password
    #   -W, --password           force password prompt (should happen automatically)
    def to_s
      "-h #{@hostname} -p #{@port} -U #{@user} -w"
    end
  end
end
