# # Sidekiq.configure_server do |config|
# #     config.redis = { url: 'redis://redis.example.com:7372/0' }
# # end

# Sidekiq.configure_server do |config|
#     config.redis = { url: "#{ENV["REDIS_URL"]}:#{ENV["REDIS_PORT"]}" }
# end
  
# Sidekiq.configure_client do |config|
#     config.redis = { url: "#{ENV["REDIS_URL"]}:#{ENV["REDIS_PORT"]}" }
# end