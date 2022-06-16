require_relative "./application_job"
require_relative "../helpers/contractors_helper"
require_relative "../helpers/licenses_helper"
require_relative "../helpers/businesses_helper"

require "rest-client"
require "json"

# DEVELOPMENT // TESTING
require "pry"

class DataJob < ApplicationJob

    URI = "https://data.wa.gov/resource"

    def call
        # initial API call: https://data.seattle.gov/resource/kzjm-xkqj.json?$$app_token=APP_TOKEN&state=WA
        dataset = "m8qx-ubtq"
        type_call = "json"
        state = "WA"
        # note extra -->  make uri_modified more abstract/extensible 
        uri_modified = DataJob::URI + "/" + dataset + "." + type_call + "?" + "$$app_token=#{ENV["APP_TOKEN"]}" + "&" + "state=" + state
        # note --> review RestClient docs to pass app token in header
        # note --> RestClient docs: https://github.com/rest-client/rest-client
        # note --> API docs: https://dev.socrata.com/docs/app-tokens.html
        response = RestClient.get(uri_modified)

        # note --> handle server responses better
        if response.code == 200
            body = JSON.parse(response.body)

            # create object containers for ActiveRecord#import
            contractors = []
            licenses = []
            businesses = []

            body.each do |hash|
                # format & create fields
                contractor = ContractorsHelper.format(hash)
                license = LicensesHelper.format(hash)
                business = BusinessesHelper.format(hash)

                # add to collection for ActiveRecord#import
                contractors << contractor
                licenses << license
                businesses << business
            end

        else
            puts "Server response code was #{response.code}"
        end

        # note --> review ActiveRecord#import docs for optimal data ingestion benchmarking
        # note --> docs: https://github.com/zdennis/activerecord-import

        # contractors_columns = ['header'.to_sym]
        # contractors_columns = ['header'.to_sym]

        # ContractorHelper.ar_import(contractors_columns, collection)
        # licenses_columns = ['header'.to_sym]
        # ContractorHelper.ar_import(contractor_columns, collection)
    end

    # note --> call ActiveJob::Base#scheduled_at according to docs refresh schedule
    # note --> ActiveJob::Base docs: https://api.rubyonrails.org/classes/ActiveJob/Core.html
end