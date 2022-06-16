module ContractorsHelper
    # container for ActiveRecord#import
    @contractors_helper = []

    def self.format_push_to_container(contractor_hash)
        self.push_to_container(self.format(contractor_hash))
    end

    def self.format(contractor_hash)
        contractor = {}

        # format name
        name = contractor_hash["primaryprincipalname"]
        name_split = name.split(", ")
        contractor["first_name"] = name_split[1]
        contractor["last_name"] = name_split[0]

        # add back keys
        contractor["ubi"] = contractor_hash["ubi"]
        contractor["primaryprincipalname"] = contractor_hash["primaryprincipalname"]

        # return new object
        contractor
    end
    
    def self.push_to_container(formatted_contractor_hash)
        @contractors_helper << formatted_contractor_hash
    end

    def self.ar_import(columns, collection)
        Contractor.ar_import(columns, collection)
    end

    def full_name
        self.first_name + self.last_name
    end
end