class Receptionist::ReceptionistsController < ApplicationController
    def dashboard
        @patients = Patient.all 
    end

end
