class Receptionist::ReceptionistsController < ApplicationController
    
    def dashboard
        @q = Patient.ransack(params[:q])
        @patients = @q.result(distinct: true).page(params[:page]).per(10)
    end

end
