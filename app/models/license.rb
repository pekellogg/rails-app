class License < ApplicationRecord
    belongs_to :contractor
    belongs_to :state

    def self.active_licenses
        today = Time.now
        self
            .select("*")
            .where("licenses.expires >= ?", today)
            .and(License.where.not(status_desc: "Suspended"))
            .order("licenses.expires")
    end

    def self.general_licenses
        self.active_licenses
            .select("*")
            .where("licenses.specialty_code_desc = 'General'")
            .order("licenses.expires")
    end

    def self.distinct_types
        today = Time.now
        self
            .select(:specialty_code_desc)
            .distinct
            .where("licenses.expires >= ? ", today)
            .where.not(status_desc: "Suspended")
            .order("licenses.specialty_code_desc")
    end

    def self.type(type)
        self.active_licenses
        .where("licenses.specialty_code_desc = ? ", type)
        .order("licenses.expires")
    end

    def display_expires
        self.expires.strftime("%m/%d/%Y")
    end

    def display_effective
        self.effective.strftime("%m/%d/%Y")
    end
end
