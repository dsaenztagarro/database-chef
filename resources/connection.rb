resource_name :postgresql_connection

property :hostname, String, default: 'localhost'
property :port, String, default: 5432
property :user, String, default: 'postgres'

action :create do

end
