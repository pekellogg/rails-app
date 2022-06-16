module ContractorsHelper
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

    def full_name
        self.first_name + self.last_name
    end
end