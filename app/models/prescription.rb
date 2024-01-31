class Prescription < ApplicationRecord
  belongs_to :medical_file
  validates :description, presence: true
end
