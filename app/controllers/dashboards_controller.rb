class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @vital_signs = VitalSign.all
    @medical_files = MedicalFile.where(user: current_user)
  end
end
