class Prescription < ApplicationRecord
  belongs_to :medical_file
  has_many_attached :photos
end
