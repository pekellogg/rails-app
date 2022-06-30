module BusinessesHelper
    def self.format(business_hash)
        business = {}
        
        # reformat key names
        business["name"] = business_hash["businessname"]
        business["address"] = business_hash["address1"]
        business["city"] = business_hash["city"]
        # business["state"] = business_hash["state"]
        business["zip"] = business_hash["zip"]
        business["phone"] = business_hash["phonenumber"]
        business["code"] = business_hash["businesstypecode"]
        business["code_desc"] = business_hash["businesstypecodedesc"]

        # manually set state
        business["state_id"] = 1#State.find{ |s| s.name_abbrev == business["state"] }

        # add back keys
        business["ubi"] = business_hash["ubi"]

        # return new object
        business
    end

    def self.create(biz_hash)
        Business.create(biz_hash)
    end
end