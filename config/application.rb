require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module InstagramClone
  class Application < Rails::Application
    config.load_defaults 6.0

    config.generators do |g|
      g.assets false
      g.helper false
    end

    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
  end
end
