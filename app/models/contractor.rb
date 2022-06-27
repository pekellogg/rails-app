class Contractor < ApplicationRecord
    has_many(:projects)
    has_many(:users, through: :projects)
    belongs_to(:business)
    # table headers constants
    COLUMNS = ["name".to_sym, "first_name".to_sym, "last_name".to_sym, "business_ubi".to_sym]

    # def self.active_licenses
    # end

    def self.first_five
        all.limit(5)
    end

    def full_name
        self.first_name + self.last_name
    end
end