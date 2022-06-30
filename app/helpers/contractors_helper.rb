module ContractorsHelper
    def self.format(contractor_hash)
        contractor = {}

        # format name
        if contractor_hash["primaryprincipalname"]
            contractor["name"] = contractor_hash["primaryprincipalname"] 
            name_split = contractor["name"].split(", ")
            contractor["first_name"] = name_split[1].titleize if name_split[1]
            contractor["last_name"] = name_split[0].titleize if name_split[0]
        end

        # add back keys
        # contractor["ubi"] = Business.find{ |biz| biz.ubi == contractor_hash["ubi"] }
        contractor["ubi"] = contractor_hash["ubi"]
        contractor["business_id"] = Business.find{ |biz| biz.ubi == contractor["ubi"] }.id

        # return new object
        contractor
    end

    def self.create(contractor_hash)
        Contractor.create(contractor_hash)
    end
end