module BusinessesHelper
    # container for ActiveRecord#import
    @businesses_helper = []

    def self.format_push_to_container(business_hash)
        self.push_to_container(self.format(business_hash))
    end

    def self.format(business_hash)
        business = {}
        
        # reformat key names
        business["name"] = business_hash["businessname"]
        business["address"] = business_hash["address1"]
        business["city"] = business_hash["city"]
        business["state"] = business_hash["state"]
        business["zip"] = business_hash["zip"]
        business["phone"] = business_hash["phonenumber"]
        business["code"] = business_hash["businesstypecode"]
        business["code_desc"] = business_hash["businesstypecodedesc"]

        # add new keys
        business["state_id"]

        # add back keys
        business["ubi"] = business_hash["ubi"]

        # return new object
        business
    end

    def self.push_to_container(formatted_business_hash)
        @businesses_helper << formatted_business_hash
    end

    def self.ar_import(columns, collection)
        Business.import(columns, collection)
    end
end