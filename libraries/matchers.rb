if defined?(ChefSpec)

  # postgresql_user

  def create_postgresql_user(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:postgresql_user, :create, resource)
  end

  def grant_postgresql_user(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:postgresql_user, :grant, resource)
  end

  # postgresql_database

  def create_postgresql_database(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:postgresql_database, :create, resource)
  end
end
