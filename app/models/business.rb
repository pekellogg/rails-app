class Business < ApplicationRecord
    # self.primary_key = "ubi"
    has_many :projects, through: :contractors
    belongs_to :state 
    
    # table headers constants
    COLUMNS = ["ubi".to_sym, "name".to_sym, "phone".to_sym, "address".to_sym, "city".to_sym, "zip".to_sym, "state".to_sym, "state_id".to_sym, "code".to_sym, "code_desc".to_sym]
end
