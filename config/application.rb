require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GetJobs
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid
    end

    config.session_store :cookie_store, key: '_interslice_session'
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use config.session_store, config.session_options

    
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins "*"
        resource(
          "*",
          headers: :any,
          methods: [:get, :patch, :put, :delete, :post, :options],
        )
      end
    end
    config.action_dispatch.default_headers = {
      'X-Content-Type-Options' => 'nosniff'
    }

    #queues
    config.active_job.queue_adapter = :sidekiq


    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
  end
end
