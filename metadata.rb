name             'database_sl'
maintainer       'David Saenz Tagarro'
maintainer_email 'david.saenz.tagarro@gmail.com'
license          'MIT'
description      'Installs/Configures database_sl'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.3'

recipe 'database_sl::postgresql', 'Installs PostgreSQL db server and client'

%w(debian ubuntu).each { |os| supports os }

source_url 'https://github.com/dsaenztagarro/database_sl' if respond_to?(:source_url)
issues_url 'https://github.com/dsaenztagarro/database_sl/issues' if respond_to?(:issues_url)
