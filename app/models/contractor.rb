class Contractor < ApplicationRecord
    has_many :projects
    has_many :users, through: :projects
    belongs_to :business
    # note --> add validations if app instantiates contractors on views

    # table headers constants
    COLUMNS = ["name".to_sym, "first_name".to_sym, "last_name".to_sym, "business_ubi".to_sym]

    # FIELDS
    # primaryprincipalname "ROMERO-ORTEGA, JUAN" // name:string
    # first_name:string
    # last_name:string
    # ubi:string (foreign key)
    
end
