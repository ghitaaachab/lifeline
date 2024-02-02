class Test < ApplicationRecord
  belongs_to :medical_file
  validates :name, presence: true
  has_one_attached :photo
end
