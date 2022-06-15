class Business < ApplicationRecord
    # note --> :contractor single or plural?
    has_many :projects, through: :contractor
    belongs_to :state

    # FIELD
    # businessname "# JUAN HANDYMAN" // name:string
    # address1 "2324 E BOONE AVE" // address:string
    # city "SPOKANE"
    # state "WA"
    # zip "99202"
    # phonenumber "5098479082" // phone:string
    # businesstypecode "I" // code:string
    # businesstypecodedesc "Individual" // code_desc:string
    # ubi:string (primary key should override id)
    # state_id:integer (foreign key)
    
end
