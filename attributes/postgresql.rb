default['database']['postgresql']['origin'] = :distribution
default['database']['postgresql']['version'] = '9.4'

# PostgreSQL Apt Repository
#
# If the version included in your version of Ubuntu is not the one you want,
# you can use the PostgreSQL Apt Repository. This repository will integrate
# with your normal systems and patch management, and provide automatic updates
# for all supported versions of PostgreSQL throughout the support lifetime of
# PostgreSQL.
#
# To discover available versions in repository:
#
# sudo apt-cache madison postgresql
#
# Example:
#
# default['database']['postgresql']['origin'] = :apt_repository
# default['database']['postgresql']['version'] = '9.4'
# default['database']['postgresql']['repository_version'] = '9.4+171.pgdg14.04+1'
