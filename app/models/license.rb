class License < ApplicationRecord
    belongs_to :contractor
    belongs_to :state

    # FIELDS
    # contractorlicensenumber "JUANHH*839MG" // number:string
    # contractorlicensetypecode "CC" // type_code :string
    # contractorlicensetypecodedesc "CONSTRUCTION CONTRACTOR" // code_desc:string
    # specialtycode1 "01" // specialty_code:string
    # specialtycode1desc "GENERAL" // specialty_code_desc:string
    # statuscode "R" // status_code:string 
    # ubi "604144929" // ubi:string (Washington Unified Business Identifier)
    # licenseeffectivedate "2017-07-07T00:00:00.000" // effective:string
    # licenseexpirationdate "2021-07-07T00:00:00.000" // expires:string
    # contractorlicensestatus "RE-LICENSED" // status_desc:string
    # **contractorlicensestatus_bool "ACTIVE" // status:string
    # contractor_id:integer (foreign key)
    # state_id:integer (foreign key)
end
