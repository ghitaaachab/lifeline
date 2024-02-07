class MedicalFile < ApplicationRecord
  belongs_to :user
  has_many :prescriptions, dependent: :destroy
  has_many :tests, dependent: :destroy
  has_many_attached :photos
  validates :name, :date, presence: true
end
