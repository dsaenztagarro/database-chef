execute 'add_apt_repository' do
  command <<-EOF
    sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
    wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -H
    apt-get update
  EOF
end

# db server
package ['postgresql-9.4', 'postgresql-contrib']

# db client
package 'postgresql-client'

# cookbook_file '/etc/postgresql/9.4/main/pg_hba.conf' do
#   source 'pg_hba.conf'
# end
