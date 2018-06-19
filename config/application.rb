require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FoundedInIreland
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application

    # Canonical host
    if ENV["CANONICAL_HOST"].present?
      config.middleware.use Rack::CanonicalHost, ENV["CANONICAL_HOST"], cache_control: "max-age=3600"
    end

    # Set IP correctly
    config.middleware.insert_before 0, Rack::CloudflareIp

    # Custom layouts for devise
    config.to_prepare do
      Devise::SessionsController.layout "admin"
      Devise::RegistrationsController.layout "admin"
      Devise::ConfirmationsController.layout "admin"
      Devise::UnlocksController.layout "admin"
      Devise::PasswordsController.layout "admin"
    end
  end
end
