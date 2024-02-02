class MedicalFile < ApplicationRecord
  belongs_to :user
  has_many :prescriptions
  has_many :tests
  validates :name, :date, presence: true
  has_one_attached :photo
end
