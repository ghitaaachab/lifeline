class Prescription < ApplicationRecord
  belongs_to :medical_file
  validates :description, presence: true
  has_one_attached :photo
end
