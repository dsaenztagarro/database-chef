require 'chefspec'
require 'chefspec/berkshelf'
require 'simplecov'
require 'simplecov-console'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  Coveralls::SimpleCov::Formatter,
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::Console
]
SimpleCov.minimum_coverage(100)
SimpleCov.start do
  add_group 'Recipes', 'recipes'
end

at_exit { ChefSpec::Coverage.report! }
