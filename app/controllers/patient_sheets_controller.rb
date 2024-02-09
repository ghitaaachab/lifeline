class PatientSheetsController < ApplicationController
  def index
    @patient_sheet = PatientSheet.new
    @vital_signs = VitalSign.all
  end

  def new
    @patient_sheet = PatientSheet.new
  end

  def create
    @patient_sheet = PatientSheet.new(patient_sheets_params)
    @patient_sheet.user = current_user
    if @patient_sheet.save!

      redirect_to dashboards_path
    else
      render :new
    end
  end

  private

  def patient_sheets_params
    params.require(:patient_sheet).permit(:blood_type, :height, :weight, :family_history, :surgical_history, :current_dr, :current_tt, :emergency_contact_name, :emergency_contact_number)
  end
end
