module LicensesHelper
    def self.format(license_hash)
        license = {}
        
        # reformat key names
        license["number"] = license_hash["contractorlicensenumber"]
        license["type_code"] = license_hash["contractorlicensetypecode"]
        license["code_desc"] = license_hash["contractorlicensetypecodedesc"]
        license["specialty_code"] = license_hash["specialtycode1"]
        license["specialty_code_desc"] = license_hash["specialtycode1desc"]
        license["status_code"] = license_hash["statuscode"]
        license["effective"] = Time.new(license_hash["licenseeffectivedate"]).strftime("%m/%d/%Y")
        license["expires"] = Time.new(license_hash["licenseexpirationdate"]).strftime("%m/%d/%Y")
        license["status_desc"] = license_hash["contractorlicensestatus"]
        
        # add new keys
        license["status"]
        license["contractor_id"]
        license["state_id"]

        # add back keys
        license["ubi"] = license_hash["ubi"]

        # return new object
        license
    end
end