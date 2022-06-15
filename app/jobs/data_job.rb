require_relative "../helpers/contractors_helper"
require_relative "../helpers/licenses_helper"
require_relative "../helpers/businesses_helper"

require "rest-client"
require "json"

# DEVELOPMENT // TESTING
require "pry"
# /home/peyton/code/projects/rails-app/rails-app/app/jobs/biz-test.txt
require_relative "./biz-test.txt"
require_relative "./lic-test.txt"

class DataJob
    URI = "https://data.wa.gov/resource"
    def self.call
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

            # testing fields for variability
            # "expires"=>"01/01/2021",
            # "status_desc"=>"RE-LICENSED"
            licenses_audit = []

            # testing fields for variability
            # does "name" always contain "X"?
            # "name"=>"# JUAN HANDYMAN"
            businesses_audit = []

            body.each do |hash|
                # format & create fields
                contractor = ContractorsHelper.format(hash)
                license = LicensesHelper.format(hash)
                business = BusinessesHelper.format(hash)

                # add to collection for ActiveRecord#import
                contractors << contractor
                licenses << license
                businesses << business

                # add to collection for audit for field variability
                licenses_audit << [license["expires"], license["status_desc"]]
                businesses_audit << business["name"]
            end

            # write to file for audit for field variability
            businesses_audit.each do | biz |
                File.write("biz-test.txt", "#{biz}\n", mode: 'a')
            end

            licenses_audit.each do | exp, status |
                File.write("lic-test.txt", "Expires: #{exp} - Status: #{status}\n", mode: 'a')
            end
        else
            puts "Server response code was #{response.code}"
        end

        binding.pry

        # note --> review ActiveRecord#import docs for optimal data ingestion benchmarking
        # note --> docs: https://github.com/zdennis/activerecord-import

        # contractors_columns = ['header'.to_sym]
        # contractors_columns = ['header'.to_sym]

        # ContractorHelper.ar_import(contractors_columns, collection)
        # licenses_columns = ['header'.to_sym]
        # ContractorHelper.ar_import(contractor_columns, collection)
    end

    # note --> call ActiveJob::Base#scheduled_at according to docs refresh schedule
    # note --> API docs: https://data.wa.gov/Labor/L-I-Contractor-License-Data-General/m8qx-ubtq
    # note --> ActiveJob::Base docs: https://api.rubyonrails.org/classes/ActiveJob/Core.html

    # begin --> example code from ActiveJob::Base docs
    # def attempt_number
    #   @attempt_number ||= 0
    # end

    # rescue_from(Timeout::Error) do |exception|
    #   raise exception if attempt_number > 5
    #   retry_job(wait: 10)
    # end
    # end --> example code from ActiveJob::Base docs
end