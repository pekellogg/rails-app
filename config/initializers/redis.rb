# require "pry"

# redis = Redis.new(
#     url: ENV["REDIS_URL"],
#     port: ENV["REDIS_PORT"],
#     password: ENV["REDIS_PASSWORD"],
#     ssl_params: {
#         ca_file: "../certs/rootCA.pem",
#         cert: OpenSSL::X509::Certificate.new(File.read("#{Rails.root}/config/certs/redis/redis-client.crt")),
#         key: OpenSSL::PKey::RSA.new(File.read("#{Rails.root}/config/certs/redis/client.key"))}
#     )

# # url: "rediss://:p4ssw0rd@10.0.1.1:6381/15"
# # maybe for redis.conf -> maxmemory-policy noeviction