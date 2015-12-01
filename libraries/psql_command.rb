module Psql
  class Command
    # @param connection [Psql::Connection]
    # @param query [String] The sql query
    def initialize(connection, query)
      @connection = connection
      @query = query
    end

    def to_s
      "psql #{@connection} --command \"#{@query}\""
    end
  end
end

