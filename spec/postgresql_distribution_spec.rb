require 'spec_helper'

describe 'database_sl::postgresql_distribution' do
  let(:version) { '9.4' }
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04') do |node|
      node.set['database']['postgresql']['origin'] = :distribution
      node.set['database']['postgresql']['version'] = version
    end.converge described_recipe
  end

  it 'installs all packages when specifying db server' do
    packages = %W(postgresql-#{version} postgresql-contrib-#{version})
    expect(chef_run).to install_package('specifying db server').with(package_name: packages)
  end

  it 'installs all packages when specifying db client' do
    expect(chef_run).to install_package('specifying db client').with(package_name: "postgresql-client-#{version}")
  end

  it 'converges successfully' do
    expect { chef_run }.to_not raise_error
  end
end
