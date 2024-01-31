class PatientSheet < ApplicationRecord
  belongs_to :user
  has_many :diseases
  has_many :allergies

  # validates :blood_type, :height, :weight, presence: true
  # validates :height, numericality: true, message: "Must be a numerical value."
  # validates :weight, numericality: true, message: "Please enter a valid numerical weight."
  # validates :label, presence: true, inclusion: { in: ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"] }
end
