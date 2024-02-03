class MedicalFile < ApplicationRecord
  belongs_to :user
  has_many :prescriptions
  has_many :tests
  validates :name, :date, presence: true
  has_many_attached :photos
  accepts_nested_attributes_for :prescriptions, :tests
end
