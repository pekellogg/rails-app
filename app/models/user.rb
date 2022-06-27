class User < ApplicationRecord
    has_many(:projects)
    has_many(:contractors, through: :projects)
    has_many(:identities)

    # NAME
    validates(:first_name, presence: true, length: { maximum: 50 })
    validates(:last_name, presence: true, length: { maximum: 50 })
    
    # EMAIL
    before_save { self.email = email.downcase if email }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates(:email,
        presence: true,
        length: { maximum: 255 },
        format: { with: VALID_EMAIL_REGEX },
        uniqueness: { case_sensitive: false })

    # PASSWORD
    has_secure_password # built-in validations: https://api.rubyonrails.org/v7.0.3/classes/ActiveModel/SecurePassword/ClassMethods.html
end