require "pry"
class LicensesController < ApplicationController
    def index
        @lookup = License.find_by(number: license_params[:query])
        @licenses = License.all
        @active_licenses = License.active_licenses
        @general_licenses = License.general_licenses
        @license_types = License.distinct_types
    end
    
    def show
        @license = License.find(params[:id]) if params[:id]
    end

    private 

    def license_params
        params.permit(:query)
    end
end