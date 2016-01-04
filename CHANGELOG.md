database_sl CHANGELOG
=====================

This file is used to list changes made in each version of the database_sl cookbook.

0.1.0
-----
- Initial release of database_sl

0.1.1
-----
- Full chefspec coverage
- Reviewed README

0.1.2
-----
- Fixed FC041: Execute resource used to run curl or wget commands

0.1.3
-----
- Fixed FC013: Use file_cache_path rather than hard-coding tmp paths

0.1.4
-----
- Added guard to adding postgresql media key
- Fixed reference to localhost in connection options (127.0.0.1)

0.1.5
-----
- Renamed `adding_apt_repository` resource to `adding_postgresql_apt_repository`

0.1.6
-----
- Added guard property to user and database resources

- - -
Check the [Markdown Syntax Guide](http://daringfireball.net/projects/markdown/syntax) for help with Markdown.

The [Github Flavored Markdown page](http://github.github.com/github-flavored-markdown/) describes the differences between markdown on github and standard markdown.
