require 'spec_helper'

describe 'database_sl::postgresql' do
  let(:package_version) { '9.4+170.pgdg14.04+1' }
  let(:version) { '9.4' }
  let(:origin) { :distribution }

  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04') do |node|
      node.set['database']['postgresql']['origin'] = origin
      node.set['database']['postgresql']['version'] = version
      node.set['database']['postgresql']['package_version'] = package_version
    end.converge described_recipe
  end

  context 'version included in distribution' do
    let(:origin) { :distribution }

    it 'includes the `postgresql_distribution` recipe' do
      expect(chef_run).to include_recipe('database_sl::postgresql_distribution')
    end
  end

  context 'version of postgresql apt repository' do
    let(:origin) { :apt_repository }

    before(:each) do
      stub_command("sudo apt-key list | grep \"PostgreSQL Debian Repository\"").and_return(false)
    end

    it 'includes the `postgresql_apt_repository` recipe' do
      expect(chef_run).to include_recipe('database_sl::postgresql_apt_repository')
    end
  end

  it 'installs all packages when specifying pg gem dependencies' do
    expect(chef_run).to install_package(['libpq-dev', 'build-essential'])
  end

  it 'creates a cookbook_file when specifying the pg_hba.conf' do
    expect(chef_run).to create_cookbook_file(
      "/etc/postgresql/#{version}/main/pg_hba.conf")
  end

  it 'restarts a service when specifying postgresql' do
    expect(chef_run).to restart_service('postgresql')
  end

  it 'converges successfully' do
    expect { chef_run }.to_not raise_error
  end
end
