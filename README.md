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
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['database_sl']['postgresql']['version']</tt></td>
    <td>String</td>
    <td>PostgreSQL database server version</td>
    <td><tt>9.4</tt></td>
  </tr>
</table>

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
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: List authors
