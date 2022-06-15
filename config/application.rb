require_relative "boot"
require_relative "../app/jobs/data_job"
require "rails"
require "bundler/setup"

# frameworks
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

Dotenv::Railtie.load
DataJob.call

module RailsApp
  class Application < Rails::Application
    # Initialize configuration defaults
    config.load_defaults 7.0

    # config/environments/* take precedence over configs here.
    # App configuration can go into files in config/initializers
    # *.rb in config/initializers are automatically loaded after loading
    # the framework and Gemfile

    # omit test files.
    config.generators.system_tests = nil
  end
end