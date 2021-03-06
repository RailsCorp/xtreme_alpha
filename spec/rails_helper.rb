require "spec_helper"
ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../config/environment", __dir__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require "rspec/rails"
require "devise"
require "devise_token_auth"
require "faker"
require "line/bot"
require "simplecov"
require "codecov"
require "database_rewinder"
OmniAuth.config.test_mode = true

SimpleCov.start

Dir[Rails.root.join("spec", "support", "**", "*.rb")].each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include FactoryBot::Syntax::Methods
  config.include Devise, type: :request
  # carrierwaveでできたファイルを削除
  config.after(:all) do
    FileUtils.rm_rf(Dir["#{Rails.root}/spec/support/uploads"]) if Rails.env.test?
  end

  config.before(:suite) do
    DatabaseRewinder.clean_all multiple: false
    # or
    # DatabaseRewinder.clean_with :any_arg_that_would_be_actually_ignored_anyway
  end

  config.after(:each) do
    DatabaseRewinder.clean multiple: false
  end

  SimpleCov.start
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end
