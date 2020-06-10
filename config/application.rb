require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Thegreatapp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.available_locales = [:en, :ru]
    config.i18n.default_locale = :ru
    config.i18n.fallbacks = true
    config.i18n.fallbacks = [:en]
    config.i18n.enforce_available_locales = true
    # config.public_file_server.enabled = true
    config.assets.digest = true
    config.assets.enabled = false
  end
end
