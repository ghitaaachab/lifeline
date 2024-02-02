class MedicalFilesController < ApplicationController
  def index
    @files = MedicalFile.all
    @file = MedicalFile.new
  end

  def new
    @file = MedicalFile.new
  end

  def create
    file = MedicalFile.new(file_params)
    file.user_id = current_user.id
    if file.save
      redirect_to medical_files_path
    else
      Rails.logger.debug(file.errors.full_messages)
      flash[:alert] = "Failed to save the MedicalFile."
    end
  end

  def show
    @file = MedicalFile.find(params[:id])
  end

  private

  def file_params
    params.require(:medical_file).permit(:name, :date, :treating_dr, :notes, :description, :photo, :user_id, :prescription, :test, :appointment, :vital_sign, :symptom, :medicine, :patient_sheet)
  end


end
