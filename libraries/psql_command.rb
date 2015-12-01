# Contains helpers for psql, the PostgreSQL interactive terminal
module Psql
  # Builds a psql command
  class Builder
    # @param connection [Psql::Connection]
    def initialize(connection)
      @connection = connection
    end

    # @param query [String] The sql query
    # @return [String] The command to run on terminal
    def build(query)
      "psql #{@connection} --command \"#{query}\""
    end
  end
end

