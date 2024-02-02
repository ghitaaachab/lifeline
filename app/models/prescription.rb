class Prescription < ApplicationRecord
  belongs_to :medical_file
  has_one_attached :photo
end
