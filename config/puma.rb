max_threads = ENV.fetch('RAILS_MAX_THREADS', 5)
min_threads = ENV.fetch('RAILS_MIN_THREADS') { max_threads }
threads(min_threads, max_threads)

rails_env = ENV.fetch('RAILS_ENV', 'development')
rails_port = ENV.fetch('PORT', 3000)
environment(rails_env)
pidfile(ENV.fetch('PIDFILE', 'tmp/pids/server.pid'))

if rails_env == 'development'
  ssl_bind(
    '0.0.0.0',
    rails_port,
    key: ENV.fetch('SSL_KEY_FILE', 'config/certs/localhost-key.pem'),
    cert: ENV.fetch('SSL_CERT_FILE', 'config/certs/localhost.pem'),
    verify_mode: 'none'
  )
else
  port(rails_port)
end

# restart puma with `rails restart`
plugin(:tmp_restart)