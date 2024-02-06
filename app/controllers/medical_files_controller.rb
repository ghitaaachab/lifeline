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
    pdf_report(:inline)
  end

  def download
    pdf_report(:attachment)
  end

  private

  def pdf_report(disposition)
    @file = MedicalFile.find_by(file_id: params[:id])
    birth_date = @file.user.date_of_birth
    age_str = calculate_age(birth_date)
    test_images = []
    prescription_images = []

    report = Prawn::Document.new
    report.text "", leading: 10
    report.text "#{@file.name}", size: 30, style: :bold, align: :center, leading: 40
    report.text "#{@file.user.first_name} #{@file.user.last_name}"
    report.text "#{@file.user.address}"
    report.text "#{age_str}"
    report.text @file.created_at.strftime("%B %d, %Y"), leading: 40
    report.text "Treating Doctor: #{@file.treating_dr}", leading: 30, style: :bold
    report.text @file.description, leading: 20
    report.text @file.notes


    @file.tests.each do |test|
      test.photos.each do |photo|
        test_images << StringIO.open(photo.download)
      end
    end

    @file.prescriptions.each do |prescription|
      prescription.photos.each do |photo|
        prescription_images << StringIO.open(photo.download)
      end
    end
    report.start_new_page
    report.text "Medical Prescriptions", size: 24, style: :bold, align: :center, leading: 40

    prescription_images.each do |image|
      report.image(image, width: 500, position: :center)
    end
    report.start_new_page
    report.text "Medical Tests:", size: 24, style: :bold, align: :center, leading: 40

    test_images.each do |image|
      report.image(image, width: 500, position: :center)
    end

    send_data(report.render,  filename: 'datareport.pdf', type: "application/pdf", disposition: disposition)
  end

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
