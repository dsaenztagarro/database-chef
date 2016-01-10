require 'spec_helper'

describe 'database_sl::postgresql_apt_repository' do
  let(:repository_version) { '9.4+170.pgdg14.04+1' }
  let(:version) { '9.4' }
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04') do |node|
      node.set['database']['postgresql']['origin'] = :apt_repository
      node.set['database']['postgresql']['repository_version'] = repository_version
      node.set['database']['postgresql']['version'] = version
    end.converge described_recipe
  end

  before(:each) do
    stub_command("sudo apt-key list | grep \"PostgreSQL Debian Repository\"").and_return(false)
  end

  it 'creates a remote_file adding postgresql media key' do
    expect(chef_run).to create_remote_file('adding_postgresql_media_key')
  end

  it 'runs a execute when adding apt repository' do
    expect(chef_run).to run_execute('adding_postgresql_apt_repository')
  end

  it 'installs all packages when specifying db server' do
    packages = %w(postgresql postgresql-contrib)
    expect(chef_run).to(install_package('specifying db server').with(
      package_name: packages, version: repository_version))
  end

  it 'installs all packages when specifying db client' do
    expect(chef_run).to(install_package('specifying db client').with(
      package_name: 'postgresql-client', version: repository_version))
  end

  it 'converges successfully' do
    expect { chef_run }.to_not raise_error
  end
end
