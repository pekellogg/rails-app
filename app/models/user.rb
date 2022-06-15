class User < ApplicationRecord
    has_many :projects
    has_many :contractors, through: :projects
    
    # ActiveModel & Bcrypt provide built-in validations
    # note --> see docs: https://api.rubyonrails.org/v7.0.3/classes/ActiveModel/SecurePassword/ClassMethods.html
    has_secure_password
    # note --> add validations for first_name, last_name, email
    
    # note --> ensure user has a submittable attribute re: project
end