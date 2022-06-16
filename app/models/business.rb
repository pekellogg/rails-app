class Business < ApplicationRecord
    # note --> :contractor single or plural?
    has_many :projects, through: :contractor
    belongs_to :state

    # table headers constants
    COLUMNS = ["ubi".to_sym, "name".to_sym, "phone".to_sym, "address".to_sym, "city".to_sym, "zip".to_sym, "state".to_sym, "state_id".to_sym, "code".to_sym, "code_desc".to_sym]

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
