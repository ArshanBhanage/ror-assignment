class Appointment < ApplicationRecord
    belongs_to :patient
    belongs_to :user
    validates :patient_id, presence: true

    def self.ransackable_attributes(auth_object = nil)
        ["appointment_date", "created_at", "doctor_id", "id", "patient_id", "reason", "updated_at"]
    end

    def patient_name
        return Patient.find(self.patient_id).name
    end

    def doctor_name
        return User.find(self.doctor_id).name
    end
    
    def self.ransackable_associations(auth_object = nil)
        ["patient", "user"]
    end

end
