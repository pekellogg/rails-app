module ContractorHelper < ApplicationHelper
    BODY = []

    def self.format(contractor)
        self.name_format(contractor)
    end

    def self.name_format(contractor)
        name = contractor["primaryprincipalname"]
        name_split = name.split(", ")
        contractor["first_name"] = name_split[1]
        contractor["last_name"] = name_split[0]
    end
end