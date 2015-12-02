include_recipe 'database_sl::postgresql'

postgresql_user 'create_user' do
  name 'webuser'
  password 'webuser123'
  action :create
end

postgresql_database 'database_test' do
  action :create
end

postgresql_user 'grant_user' do
  database_name 'database_test'
  name 'webuser'
  password 'webuser123'
  privileges ['ALL PRIVILEGES']
  action :grant
end
