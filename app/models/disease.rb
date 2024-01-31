class Disease < ApplicationRecord
  belongs_to :patient_sheet
  validates :name, presence: true
end
