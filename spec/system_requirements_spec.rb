require 'spec_helper'

describe 'database_sl::system_requirements' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04') do |node|
      node.set['database']['postgresql']['version'] = '9.4'
    end.converge described_recipe
  end

  it 'runs a execute when specifying system locales' do
    expect(chef_run).to run_execute('system_locales')
  end

  it 'installs all packages when given `wget, ca-certificates`' do
    expect(chef_run).to install_package(['wget', 'ca-certificates'])
  end
end
