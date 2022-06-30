require "pry"
class Contractor < ApplicationRecord
    has_many :projects
    has_many :users, through: :projects
    belongs_to :business

    def self.first_five
        all.limit(5)
    end

    def full_name
        "#{self.first_name} #{self.last_name}"
    end
end