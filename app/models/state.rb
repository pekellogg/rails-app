class State < ApplicationRecord
    has_many :licenses
    has_many :contractors, through: :licenses
end
