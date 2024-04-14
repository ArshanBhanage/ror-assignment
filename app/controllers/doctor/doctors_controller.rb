class Doctor::DoctorsController < ApplicationController
    def dashboard
        @q = Patient.ransack(params[:q])
        @patients = @q.result(distinct: true).page(params[:page]).per(10)
    end

    def analytics
        @patients_per_day = Patient.group_by_day(:created_at, last: 7).count
        @gender_pie = Patient.group(:gender).count
        @appointments_per_month = Appointment.group_by_month(:created_at).count
    end
end
