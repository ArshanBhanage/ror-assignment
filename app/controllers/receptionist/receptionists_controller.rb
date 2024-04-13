class Receptionist::ReceptionistsController < ApplicationController
    def dashboard
        @patients = Patient.all 
        @appointments = Appointment.all
    end

    def past_appointments
        @appointments = Appointment.where(patient_id: params[:patient_id])
    end

end
