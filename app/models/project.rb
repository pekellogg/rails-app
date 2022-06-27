class Project < ApplicationRecord
    belongs_to(:contractor)
    belongs_to(:user)
    validates_presence_of(:name, :type, :desc)

    TYPES = ["Kitchen", "Bathroom", "Basement", "Bedroom", "Living/Dining", "Outdoor Living", "Landscape", "Garage", "Home Office"]
end
