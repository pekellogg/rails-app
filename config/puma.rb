require "rake"
require "pry"

# Puma serves requests using a thread pool
# MRI Ruby's GVL: only 1 thread can run Ruby code at a time

# instantiate workers (forked webserver processes) to boot in clustered mode
workers Integer(ENV["WEB_CONCURRENCY"] || 2)

# default should match Active Record's
max_threads = Integer(ENV["RAILS_MAX_THREADS"] || 5)
min_threads = ENV.fetch("RAILS_MIN_THREADS") { max_threads }
threads(min_threads, max_threads)

# 1. boot app, load code THEN 2. fork app: workers use less memory by taking advantage of CoW process behavior
preload_app!

# set Puma environment
rails_port = ENV.fetch("PORT") { 3000 }
rails_env = ENV.fetch("RAILS_ENV", "development")
environment(rails_env)
pidfile ENV.fetch("PIDFILE")  { "tmp/pids/server.pid" }

if rails_env == "development"
  ssl_bind(
    "0.0.0.0",
    rails_port,
    key: ENV.fetch("SSL_KEY_FILE", "config/certs/localhost-key.pem"),
    cert: ENV.fetch("SSL_CERT_FILE", "config/certs/localhost.pem"),
    verify_mode: "none"
  )
else
  port(rails_port)
end

# GC 4x before forking workers
# nakayoshi_fork # --> OK for MRI Ruby per Puma 5.6.4 docs
# wait_for_less_busy_worker
# fork_worker

# after_worker_boot do
#   Rails.app_class.load_tasks
#   begin
#     Rake::Task["external_data:refresh"].execute
#     Rake::Task["external_data:refresh"].reenable
#   rescue Exception => e
#     Rails.logger.error "ERROR with external_data:refresh Rake job"
#     Rails.logger.error(e.inspect)
#     Rails.logger.error(e.backtrace)
#   end
# end

# restart puma with `rails restart`
plugin(:tmp_restart)

# $ bundle exec puma -C config/puma.rb