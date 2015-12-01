include_recipe 'database_sl::postgresql'

postgresql_user 'webuser' do
  password 'webuser123'
  action :create
end

postgresql_database 'database_test' do
  action :create
end

postgresql_user 'webuser' do
  database_name 'database_test'
  password 'webuser123'
  privileges ['ALL PRIVILEGES']
  action :grant
end
