class MedicalFilesController < ApplicationController
  def index
    @files = MedicalFile.where(user_id: current_user.id)
    @file = MedicalFile.new
  end

  def new
    @file = MedicalFile.new
  end

  def create
    @file = MedicalFile.new(file_params)
    @file.user = current_user
    @file.file_id = Time.now.to_f.to_s.gsub(".", "")

    @test = Test.new
    @prescription = Prescription.new

    @test.medical_file = @file
    @test.photos = params[:medical_file][:test_files]
    @prescription.medical_file = @file
    @prescription.photos = params[:medical_file][:prescription_files]

    raise

    unless @test.save
      flash[:alert] = "Failed to save the test file."
      return
    end

    unless @prescription.save
      flash[:alert] = "Failed to save the prescription File."
      return
    end

    if @file.save
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
    params.require(:medical_file).permit(
      :name, :date, :treating_dr, :notes, :description)
  end
end
