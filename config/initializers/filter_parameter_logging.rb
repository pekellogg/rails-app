# Be sure to restart your server when you modify this file.

# params to omit from log file
Rails.application.config.filter_parameters += [
  :passw]#, :secret, :token, :_key, :crypt, :salt, :certificate, :otp, :ssn
#]