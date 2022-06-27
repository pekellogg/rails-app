class ContractorsController < ApplicationController
    def index
        @contractors = Contractor.all 
    end
    
    def show
        @contractor = Contractor.find(params[:id])
    end

    def create
        @contractor = Contractor.create(hash)
    end

    def update
        @contractor = Contractor.find(params[:id])
        @contractor.update(hash)
    end

    def destroy
        @contractor = Contractor.find(params[:id])
        @contractor.destroy
    end
end