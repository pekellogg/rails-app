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
    def self.call
        response = RestClient.get(self.form_uri)
        if response.code == 200
            body = JSON.parse(response.body)
            body.each do |hash|
                # push prepped and formatted fields to helper containers
                ContractorsHelper.format_push_to_container(hash)
                LicensesHelper.format_push_to_container(hash)
                BusinessesHelper.format_push_to_container(hash)
            end
        else
            "Server response code was #{response.code}"
        end
    end

    def self.response_body
        @response_body
    end

    def self.prep_format
        self.response_body.each do |hash|
            # push prepped and formatted fields to helper containers
            ContractorsHelper.format_push_to_container(hash)
            LicensesHelper.format_push_to_container(hash)
            BusinessesHelper.format_push_to_container(hash)
        end
    end

    def self.import_formats
        ContractorsHelper.ar_import(Contractor::COLUMNS, @contractors_helper)
        LicensesHelper.ar_import(License::COLUMNS, @licenses_helper)
        BusinessesHelper.ar_import(Business::COLUMNS, @businesses_helper)
    end

    def self.clear_class_vars
        @contractors_helper.clear
        @licenses_helper.clear
        @businesses_helper.clear
    end
end