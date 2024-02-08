class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @patient_sheet = PatientSheet.find_by(user_id: current_user.id)
    @vital_signs = VitalSign.all
    @medical_files = MedicalFile.where(user: current_user)
  end
end
