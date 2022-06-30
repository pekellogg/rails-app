require_relative "./application_job"
require_relative "../helpers/application_data"
require_relative "../helpers/contractors_helper"
require_relative "../helpers/licenses_helper"
require_relative "../helpers/businesses_helper"

require "rest-client"
require "json"
require "pry"

module DataJob

    def self.form_uri
        ApplicationData::URI + "/" + ApplicationData::DATASET + ApplicationData::CALL_FORMAT + "?" + "$$app_token=#{ENV["APP_TOKEN"]}" + "&state=" + ApplicationData::STATE
    end
  
    # initial call: https://data.seattle.gov/resource/kzjm-xkqj.json?$$app_token=APP_TOKEN&state=WA
    def self.call_and_create
        response = RestClient.get(self.form_uri)
        if response.code == 200
            body = JSON.parse(response.body)
            body.each do |hash|
                biz = BusinessesHelper.create(BusinessesHelper.format(hash))
                contractor = ContractorsHelper.create(ContractorsHelper.format(hash))
                license = LicensesHelper.create(LicensesHelper.format(hash))
            end
        else
            "Server response code was #{response.code}"
        end
    end

end