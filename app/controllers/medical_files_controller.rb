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
    @tests = @file.tests
    @prescriptions = @file.prescriptions
  end

  def preview
    @file = MedicalFile.find_by(file_id: params[:id])
    birth_date = @file.user.date_of_birth
    age_str = calculate_age(birth_date)

    report = Prawn::Document.new
    report.text "#{@file.name}", size: 30, style: :bold, align: :center, leading: 20
    report.text "#{@file.user.first_name} #{@file.user.last_name}"
    report.text "#{@file.user.address}"
    report.text "#{age_str}"
    report.text @file.description
    report.start_new_page
    report.text 'This Page for Photos'
    send_data(report.render,  filename: 'datareport.pdf', type: "application/pdf", disposition: "inline")
  end

  private

  def calculate_age(birth_date)
    today = Date.today
    age = today.year - birth_date.year - ((today.month < birth_date.month || (today.month == birth_date.month && today.day < birth_date.day)) ? 1 : 0)
    "#{age} Years Old"
  end

  def file_params
    params.require(:medical_file).permit(
      :name, :date, :treating_dr, :notes, :description)
  end
end
