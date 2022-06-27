# invoke with `rails external_data:refresh`
require_relative "../../app/jobs/data_job"
require "pry"

# namespace :external_data do
desc "retrieve and refresh app external data"
task refresh: :environment do
    Rake::Task["drop_tables"].execute
    Rake::Task["api_call"].execute
    Rake::Task["format_data"].execute
    Rake::Task["import_data"].execute
end

# drop tables
desc "drop tables with external data"
task drop_tables: :environment do
    ActiveRecord::Migration.drop_table(:businesses, if_exists: true)
    ActiveRecord::Migration.drop_table(:contractors, if_exists: true)
    ActiveRecord::Migration.drop_table(:licenses, if_exists: true)
end

# call API
desc "initial API call"
task api_call: :environment do
    include DataJob
    DataJob::call
end

# format API data
desc "format data from initial API call"
task format_data: :environment do
    include DataJob
    DataJob::prep_format
end

# import API data
desc "import data from initial API call"
task import_data: :environment do
    include DataJob
    DataJob::import_formats
end

# end