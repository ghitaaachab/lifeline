class PatientSheet < ApplicationRecord
  belongs_to :user
  has_many :diseases
  has_many :allergies

  validates :height, numericality: { message: "Must be a numerical value."}
  validates :weight, numericality:{ message: "Please enter a valid numerical weight."}
  validates :blood_type, presence: true, inclusion: { in: ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"] }
end
