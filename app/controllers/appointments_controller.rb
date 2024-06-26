class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[ show edit update destroy ]

  # GET /appointments or /appointments.json
  def index
    @q = Appointment.ransack(params[:q])
    @appointments = @q.result(distinct: true).page(params[:page]).per(10)
  end

  # GET /appointments/1 or /appointments/1.json
  def show
  end

  def past_appointments
    @appointments = Appointment.where(patient_id: params[:patient_id]).page(params[:page]).per(10)
  end

  def upcoming
    if current_user.doctor?
      @appointments = Appointment.where("appointment_date >= ?", Time.now).where(user_id: current_user.id).order(:appointment_date).page(params[:page]).per(10)
    else
      @appointments = Appointment.where("appointment_date >= ?", Time.now).order(:appointment_date).page(params[:page]).per(10)
    end
  end


  # GET /appointments/new
  def new
    @doctors = User.where(role: 'doctor') 
    @patient = Patient.find(params[:patient_id])
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
    @doctors = User.where(role: 'doctor')    
  end

  # POST /appointments or /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to root_path, notice: "Appointment was successfully created." }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1 or /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to root_path, notice: "Appointment was successfully updated." }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1 or /appointments/1.json
  def destroy
    @appointment.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Appointment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appointment_params
      params.require(:appointment).permit(:patient_id, :user_id, :appointment_date, :reason)
    end
end
