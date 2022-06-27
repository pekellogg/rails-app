Rails.application.configure do
  # Settings here take precedence over config/application.rb.

  # development environment #=> app code reloaded per request
  # slows response time; ideal development since no web server restarts to reflect changes.
  config.cache_classes = false

  # re: boot.
  config.eager_load = false

  # full error reports.
  config.consider_all_requests_local = true

  # Force all access to the app over SSL, use Strict-Transport-Security
  # note --> investigate: are cookies secure cookies?
  config.force_ssl = true #{secure_cookies: false}

  # explicitly-defined Rails 7 defaults
  config.session_store :cookie_store#, key: "rails-app"

  # Enable/disable caching. Caching disabled by default.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  # Store uploaded files on local system #=> config/storage.yml
  config.active_storage.service = :local

  # Don't raise mailer erorrs.
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false

  # see deprecation notices in logger
  config.active_support.deprecation = :log

  # Raise error if pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Debug mode disables concatenation, preprocessing of assets.
  # might cause significant delays in view rendering with many complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # ACTIVE RECORD
  config.active_record.default_timezone = :local # default: UTC

  # NOTES
  # 3.5.13 ActionDispatch::Cookies

  # Sets cookies for the request.
  # 3.5.14 ActionDispatch::Session::CookieStore

  # Is responsible for storing the session in cookies. An alternate middleware can be used for this by changing config.session_store.
  # 3.5.15 ActionDispatch::Flash

  # Sets up the flash keys. Only available if config.session_store is set to a value.
  # 3.5.16 Rack::MethodOverride

  # Allows the method to be overridden if params[:_method] is set. This is the middleware which supports the PATCH, PUT, and DELETE HTTP method types.

  # WEB SERVER HEADERS 7.0
#   {
#   "X-Frame-Options" => "SAMEORIGIN",
#   "X-XSS-Protection" => "0",
#   "X-Content-Type-Options" => "nosniff",
#   "X-Download-Options" => "noopen",
#   "X-Permitted-Cross-Domain-Policies" => "none",
#   "Referrer-Policy" => "strict-origin-when-cross-origin"
# }

  config.rake_eager_load = true
end
