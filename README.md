[![Cookbook Version](https://img.shields.io/cookbook/v/database_sl.svg)](https://community.opscode.com/cookbooks/database_sl)

database_sl Cookbook
====================

Super light database cookbook

Requirements
------------
TODO: List your cookbook requirements. Be sure to include any requirements this cookbook has on platforms, libraries, other cookbooks, packages, operating systems, etc.

e.g.
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
    "recipe[database_sl]"
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
