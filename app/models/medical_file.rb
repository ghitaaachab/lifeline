class MedicalFile < ApplicationRecord
  belongs_to :user
  has_many :prescriptions
  has_many :tests
  has_many_attached :photos
  validates :name, :date, presence: true
  accepts_nested_attributes_for :prescriptions, :tests
end
