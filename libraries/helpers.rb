# @param query [String] The command to run with psql
# @return [String] The psql shell command
def psql_for(query)
  @builder ||= Psql::Builder.new(connection)
  @builder.build(query)
end

def search_command_for(query)
  "#{psql_for(query)} | grep #{name}"
end
