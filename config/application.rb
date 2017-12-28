require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ConRails
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Don't generate system test files.
    config.i18n.available_locales = [ :en, :de ]
    config.i18n.default_locale = :en
    config.generators.system_tests = nil
    config.generators do |g|
      g.test_framework :rspec,
        :fixtures => true,
        :view_specs => true,
        :helper_specs => true,
        :routing_specs => true,
        :controller_specs => true,
        :request_specs => true
      g.fixture_replacement :factory_bot, :dir => "spec/factories"
    end
    config.active_job.queue_adapter = :delayed_job
  end
end
