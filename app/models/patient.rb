class Patient < ApplicationRecord

    has_many :appointments

    def self.ransackable_attributes(auth_object = nil)
        ["address", "created_at", "dob", "email", "first_name", "gender", "id", "last_name", "phone", "updated_at"]
    end

    def self.ransackable_associations(auth_object = nil)
        ["appointments"]
    end

    def name
        return self.first_name + " " + self.last_name 
    end
end
