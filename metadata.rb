name             'database_sl'
maintainer       'David Saenz Tagarro'
maintainer_email 'david.saenz.tagarro@gmail.com'
license          'MIT'
description      'Installs/Configures database_sl'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe 'database_sl::postgresql', 'Installs PostgreSQL db server and client'

%w(debian ubuntu).each { |os| supports os }
