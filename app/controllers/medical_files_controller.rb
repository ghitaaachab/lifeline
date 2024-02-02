class MedicalFilesController < ApplicationController
  def index
    @files = MedicalFile.where(user_id: current_user.id)
    @file = MedicalFile.new
  end

  def new
    @file = MedicalFile.new
  end

  def create
    file = MedicalFile.new(file_params)
    file.user_id = current_user.id
    file.file_id = Time.now.to_f.to_s.gsub(".", "")
    if file.save
      redirect_to medical_files_path
    else
      Rails.logger.debug(file.errors.full_messages)
      flash[:alert] = "Failed to save the MedicalFile."
    end
  end

  def show
    @file = MedicalFile.find_by(file_id: params[:id])
  end

  private

  def file_params
    params.require(:medical_file).permit(:name, :date, :treating_dr, :notes, :description)
  end

end
