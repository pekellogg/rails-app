require "rake"
# set military time
set :chronic_options, hours24: true
# set log path
set :output, "../app/log/data_job.log"
# set environment
set :environment, "development"

# update schedule reflects external API's: 7:30 a.m., 12:15 p.m., 5:15 p.m.
# every 1.day, at: ["7:30", "12:15", "17:15"] do
#     rake "external_data:refresh"
# end

# TESTING
# every 1.minute do
#     rake "external_data:refresh"
# end

# HELPFUL
# write to crontab
# $ whenever --user --update-crontab
# list current jobs
# crontab -l
# whenever --help