class Contractor < ApplicationRecord
    has_many :projects
    has_many :users, through: projects
    belongs_to :business
    # note --> add validations if app instantiates contractors on views

    # FIELDS
    # primaryprincipalname "ROMERO-ORTEGA, JUAN" // name:string
    # first_name:string
    # last_name:string
    # ubi:string (foreign key)
    
end
