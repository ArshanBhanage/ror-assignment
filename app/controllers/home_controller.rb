class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if current_user
      if current_user.doctor?
        redirect_to doctor_dashboard_path
      elsif current_user.receptionist?
        redirect_to receptionist_dashboard_path
      end      
    end    
  end
end
