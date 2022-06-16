# invoke with `rails external_data:refresh`
require_relative "../../app/jobs/data_job"
require "pry"

namespace :external_data do

    desc "retrieve and refresh app external data"
    task refresh: :environment do
        Rake::Task["external_data:drop_bcl_tables"].execute
        Rake::Task["external_data:call_api"].execute
        Rake::Task["external_data:format_data"].execute
        Rake::Task["external_data:import_data"].execute
    end

    # drop tables
    task drop_bcl_tables: :environment do
        ActiveRecord::Migration.drop_table(:businesses, if_exists: true)
        ActiveRecord::Migration.drop_table(:contractors, if_exists: true)
        ActiveRecord::Migration.drop_table(:licenses, if_exists: true)
    end
    
    # call API
    task call_api: [:environment, :drop_bcl_tables] do
        include DataJob
        DataJob::call
    end

    # format API data
    task format_data: [:environment, :call_api] do
        include DataJob
        DataJob::prep_format
    end

    # import API data
    task import_data: [:environment, :format_data] do
        include DataJob
        DataJob::import_formats
    end

end