module LicensesHelper
    # t.integer "contractor_id"
    def self.format(license_hash)
        license = {}
        
        # reformat key names
        license["number"] = license_hash["contractorlicensenumber"]
        license["type_code"] = license_hash["contractorlicensetypecode"]
        license["code_desc"] = license_hash["contractorlicensetypecodedesc"]
        license["specialty_code"] = license_hash["specialtycode1"]
        license["specialty_code_desc"] = license_hash["specialtycode1desc"].titleize if license_hash["specialtycode1desc"]
        license["status_code"] = license_hash["statuscode"]
        license["status_desc"] = license_hash["contractorlicensestatus"].titleize if license_hash["contractorlicensestatus"]

        # reformat key names: reformat date values
        effective = license_hash["licenseeffectivedate"].split("-")
        le_year = effective[0].to_i
        le_month = effective[1].to_i
        le_day = effective[2].to_i
        license["effective"] = Time.new(le_year, le_month, le_day)#.strftime("%m/%d/%Y")
        expires = license_hash["licenseexpirationdate"].split("-")
        lexp_year = expires[0].to_i
        lexp_month = expires[1].to_i
        lexp_day = expires[2].to_i
        license["expires"] = Time.new(lexp_year, lexp_month, lexp_day)#.strftime("%m/%d/%Y")

        # add back keys
        license["ubi"] = license_hash["ubi"]

        # add new keys
        license["contractor_id"] = Contractor.find { |c| c.ubi == license["ubi"] }.id

        # manually set state
        license["state_id"] = 1#State.find{ |s| s.name_abbrev == "WA" }

        # return new object
        license
    end

    def self.create(license_hash)
        License.create(license_hash)
    end
end