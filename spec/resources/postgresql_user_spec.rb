require 'chefspec'

describe 'database_sl::postgresql_test' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(step_into: ['']).converge('database_sl::postgresql_test')
  end

  before(:each) do
    stub_command("grep -q http://apt.postgresql.org/pub/repos/apt/ /etc/apt/sources.list.d/pgdg.list").and_return(false)
  end

  it 'includes the `postgresql` recipe' do
    expect(chef_run).to include_recipe('database_sl::postgresql')
  end

  it 'creates a postgresql user' do
    expect(chef_run).to create_postgresql_user('webuser')
  end

  it 'creates a postgresql database' do
    expect(chef_run).to create_postgresql_database('database_test')
  end
end
