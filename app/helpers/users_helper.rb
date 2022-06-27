module UsersHelper
    def name
        "#{self.first_name} #{self.last_name}"
    end

    def self.user_with_email(email)
        User.find_by(email: email)
    end
end