class PatientSheetController < ApplicationController
  def index
    @patient_sheet = PatientSheet.new
    @vital_signs = VitalSign.all
  end
  def create
    patient_sheet = PatientSheet.new(patient_sheet_params)
    patient_sheet.user_id = current_user.id


    if patient_sheet.save!
      redirect_to patient_sheet_path, notice: ' added successfully.'
    else
      render :new
    end
  end

  private

  def patient_sheet_params
    params.require(:patient_sheet).permit(:blood_type, :height, :weight, :family_history, :surgical_history, :current_dr, :current_tt, :emergency_contact_name, :emergency_contact_number )
  end
end
