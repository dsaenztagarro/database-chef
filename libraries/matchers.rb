if defined?(ChefSpec)

  # postgresql_user

  def create_postgresql_user(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:postgresql_user, :create, resource_name)
  end

  def grant_postgresql_user(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:postgresql_user, :grant, resource_name)
  end

  # postgresql_database

  def create_postgresql_database(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:postgresql_database, :create, resource_name)
  end
end
