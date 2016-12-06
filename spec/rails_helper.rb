# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start 'rails'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'webmock/rspec'
require_relative '../lib/spec/api_constraints_spec.rb'
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
#Delayed::Worker.delay_jobs = false

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include Request::JsonHelpers, :type => :controller
  config.include Request::HeadersHelpers, :type => :controller
  config.include Devise::Test::ControllerHelpers, :type => :controller
  config.include FactoryGirl::Syntax::Methods
  config.include ActiveJob::TestHelper, type: :job
  config.include AbstractController::Translation

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

end
