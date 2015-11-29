execute 'system-locales' do
  command <<-EOH
    locale-gen en_US.UTF-8
    update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
  EOH
end

package ['wget', 'ca-certificates']

execute 'add_apt_repository' do
  user 'root'
  command <<-EOF
    sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
    apt-get -y update
  EOF
  not_if 'grep -q http://apt.postgresql.org/pub/repos/apt/ /etc/apt/sources.list.d/pgdg.list'
end

# db server
version = node['postgresql']['version']

package ["postgresql-#{version}", "postgresql-contrib-#{version}"]

# db client
package "postgresql-client-#{version}"

# update config
cookbook_file "/etc/postgresql/#{version}/main/pg_hba.conf" do
  group 'postgres'
  source 'pg_hba_trust_local.conf'
  user 'postgres'
end

execute 'service_restart' do
  command 'service postgresql restart'
end
