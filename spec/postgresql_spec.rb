require 'spec_helper'

describe 'database_sl::postgresql' do
  let(:postgresql_package_version) { '9.4+170.pgdg14.04+1' }
  let(:postgresql_version) { '9.4' }
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04') do |node|
      node.set['database']['postgresql']['package_version'] = postgresql_package_version
      node.set['database']['postgresql']['version'] = postgresql_version
    end.converge described_recipe
  end

  before(:each) do
    stub_command("sudo apt-key list | grep \"PostgreSQL Debian Repository\"").and_return(false)
  end

  it 'creates a remote_file adding postgresql media key' do
    expect(chef_run).to create_remote_file('adding_postgresql_media_key')
  end

  it 'runs a execute when adding apt repository' do
    expect(chef_run).to run_execute('adding_apt_repository')
  end

  it 'installs all packages when specifying db server' do
    packages = ['postgresql', 'postgresql-contrib']
    expect(chef_run).to install_package(packages).with(version: postgresql_package_version)
  end

  it 'installs all packages when specifying db client' do
    expect(chef_run).to install_package('postgresql-client').with(version: postgresql_package_version)
  end

  it 'installs all packages when specifying pg gem dependencies' do
    expect(chef_run).to install_package(['libpq-dev', 'build-essential'])
  end

  it 'creates a cookbook_file when specifying the pg_hba.conf' do
    expect(chef_run).to create_cookbook_file(
      "/etc/postgresql/#{postgresql_version}/main/pg_hba.conf")
  end

  it 'restarts a service when specifying postgresql' do
    expect(chef_run).to restart_service('postgresql')
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end
