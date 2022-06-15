class Project < ApplicationRecord
    belongs_to :contractor
    belongs_to :user
    # note --> add validations
end
