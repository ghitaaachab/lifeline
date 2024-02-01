class MedicalFilesController < ApplicationController
  def index
    @files = MedicalFile.all
    @file = MedicalFile.new(file_params)
    @file.save
  end

  private

  def file_params
    params.require(:file).permit(:name, :date)
  end
end
