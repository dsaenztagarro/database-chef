require 'spec_helper'

describe 'database_sl::postgresql' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04') do |node|
      node.set['database_sl']['postgresql']['version'] = '9.4'
    end.converge described_recipe
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end
