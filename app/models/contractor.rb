class Contractor < ApplicationRecord
    has_many(:projects)
    has_many(:users, through: :projects)
    belongs_to(:business)
    # table headers constants
    COLUMNS = ["name".to_sym, "first_name".to_sym, "last_name".to_sym, "business_ubi".to_sym]
end
