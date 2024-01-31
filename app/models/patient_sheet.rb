class PatientSheet < ApplicationRecord
  belongs_to :user
  has_many :diseases
  has_many :allergies

  validates :height, numericality: true, message: "Must be a numerical value."
  validates :weight, numericality: true, message: "Please enter a valid numerical weight."
  validates :blood_type, presence: true, inclusion: { in: ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"] }
end
