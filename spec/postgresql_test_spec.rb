require 'spec_helper'

describe 'database_sl::postgresql_test' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04') do |node|
      node.set['database']['postgresql']['package_version'] = '9.4+170.pgdg14.04+1'
      node.set['database']['postgresql']['version'] = '9.4'
    end.converge described_recipe
  end

  before(:each) do
    stub_command("sudo apt-key list | grep \"PostgreSQL Debian Repository\"").and_return(false)
  end

  it 'creates database user' do
    expect(chef_run).to create_postgresql_user('create_user')
  end

  it 'creates production database schema' do
    expect(chef_run).to create_postgresql_database('database_test')
  end

  it 'grant privileges to database user' do
    expect(chef_run).to grant_postgresql_user('grant_user')
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end
