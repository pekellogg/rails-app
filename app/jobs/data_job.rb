require "rest-client"
require "json"

class DataJob < ApplicationJob
    def self.call
        # initial API call: https://data.seattle.gov/resource/kzjm-xkqj.json?$$app_token=APP_TOKEN&state=WA
        URI = "https://data.wa.gov/resource"
        dataset = "m8qx-ubtq"
        type_call = "json"
        state = "WA"

        # note --> use ENV to load app token
        uri_modified = URI + "/" + dataset + "." + type_call + "?" + "$$app_token=#{ENV["APP_TOKEN"]}" + "&" + "state=" + state
        
        # note --> review RestClient docs to pass app token in header
        # note --> RestClient docs: https://github.com/rest-client/rest-client
        # note --> API docs: https://dev.socrata.com/docs/app-tokens.html
        response = RestClient.get(uri_modified)

        # note --> handle server responses better
        if response.code == 200
            body = JSON.parse(response.body) 
            # note --> add class constant containing response body to reduce API calls in development
            # ApplicationRecord::BODY << body if body

            contractors = []
            body.each do |hash|
                contractor = ContractorHelper.format(hash)
                binding.pry
                contractors << contractor
            end
            binding.pry
        else
            puts "Server response code was #{response.code}"
        end
        # note --> review ActiveRecord#import docs for optimal data ingestion benchmarking
        # note --> docs: https://github.com/zdennis/activerecord-import
        # columns = ['header'.to_sym]
        # ContractorHelper.ar_import(columns, collection)
    end

    # note --> call ActiveJob::Base#scheduled_at according to docs refresh schedule
    # note --> API docs: https://data.wa.gov/Labor/L-I-Contractor-License-Data-General/m8qx-ubtq
    # note --> ActiveJob::Base docs: https://api.rubyonrails.org/classes/ActiveJob/Core.html

    # begin --> example code from ActiveJob::Base docs
    # attr_writer :attempt_number
    # def attempt_number
    #   @attempt_number ||= 0
    # end
    # def serialize
    #   super.merge('attempt_number' => attempt_number + 1)
    # end
    # def deserialize(job_data)
    #   super
    #   self.attempt_number = job_data['attempt_number']
    # end
    # rescue_from(Timeout::Error) do |exception|
    #   raise exception if attempt_number > 5
    #   retry_job(wait: 10)
    # end
    # end --> example code from ActiveJob::Base docs
end