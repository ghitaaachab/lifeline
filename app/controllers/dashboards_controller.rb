class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @patient_sheet = current_user.patient_sheet
    @vital_signs = VitalSign.all
    @medical_files = MedicalFile.where(user: current_user)
  end
end
