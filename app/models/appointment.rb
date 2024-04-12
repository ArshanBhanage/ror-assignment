class Appointment < ApplicationRecord
    validates :patient_id, presence: true
end
