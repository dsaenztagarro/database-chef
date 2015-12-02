[![Cookbook Version](https://img.shields.io/cookbook/v/database_sl.svg)](https://community.opscode.com/cookbooks/database_sl)
[![Build Status](https://travis-ci.org/dsaenztagarro/database_sl.svg?branch=master)](https://travis-ci.org/dsaenztagarro/database_sl)
[![Code Climate](https://codeclimate.com/github/dsaenztagarro/database_sl/badges/gpa.svg)](https://codeclimate.com/github/dsaenztagarro/database_sl)
[![Coverage Status](https://coveralls.io/repos/dsaenztagarro/database_sl/badge.svg?branch=master&service=github)](https://coveralls.io/github/dsaenztagarro/database_sl?branch=master)
[![Dependency Status](https://gemnasium.com/dsaenztagarro/database_sl.svg)](https://gemnasium.com/dsaenztagarro/database_sl)

database_sl Cookbook
====================

Super light database cookbook. As opposed to other database cookbooks, to run
queries it is used only the official terminal-based tool.
Living on the edge, it is used the approach to build [custom
resources](https://docs.chef.io/custom_resources.html) introduced in
chef-client version 12.5.

Requirements
------------

#### Platforms
- Ubuntu 14.04 LTS

#### Chef
- Chef 12.2.0

#### packages
- `toaster` - database_sl needs toaster to brown your bagel.

Attributes
----------

#### database_sl::postgresql

See `attributes/postgresql.rb` for default values.

* `node['database']['postgresql']['version']` - Version of the postgresql db

Resources
---------

Example create postgresql user:

```ruby
postgresql_user 'create_webuser' do
  name 'webuser'
  password 'webuser123'
  action :create
end
```

Example grant privileges to postgresql user:

```ruby
postgresql_user 'grant_webuser' do
  database_name 'database_test'
  name 'webuser'
  password 'webuser123'
  privileges ['ALL PRIVILEGES']
  action :grant
end
```

Example create postgresql database:

```ruby
postgresql_database 'database_test' do
  action :create
end

```
Usage
-----

#### database_sl::postgresql

Just include `database_sl` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[database_sl::postgresql]"
  ]
}
```

For sharing at Chef Supermarket:

```
knife cookbook site share "database_sl" "Databases"
```



Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: List authors
