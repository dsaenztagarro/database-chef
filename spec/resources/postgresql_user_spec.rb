require 'chefspec'

describe 'database_sl::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(step_into: ['']).converge('database_sl::default')
  end

  it 'installs the database_sl package through my_lwrp' do
    expect(chef_run).to install_package('database_sl')
  end
end
