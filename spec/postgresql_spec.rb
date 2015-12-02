require 'spec_helper'

describe 'database_sl::postgresql' do
  let(:postgresql_version) { '9.4' }
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04') do |node|
      node.set['database_sl']['postgresql']['version'] = postgresql_version
    end.converge described_recipe
  end

  before(:each) do
    stub_command('grep -q http://apt.postgresql.org/pub/repos/apt/ /etc/apt/sources.list.d/pgdg.list').and_return(false)
  end

  it 'runs a execute when adding apt repository' do
    expect(chef_run).to run_execute('adding_apt_repository')
  end

  it 'creates a cookbook_file when specifying the pg_hba.conf' do
    expect(chef_run).to create_cookbook_file(
      "/etc/postgresql/#{postgresql_version}/main/pg_hba.conf")
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end
