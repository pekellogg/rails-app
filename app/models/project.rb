class Project < ApplicationRecord
    belongs_to(:contractor)
    belongs_to(:user)
    validates_presence_of(:name, :desc)
end