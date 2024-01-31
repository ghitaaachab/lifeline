class Allergy < ApplicationRecord
  belongs_to :patient_sheet
  validates :type, presence: true
end
