class Test < ApplicationRecord
  belongs_to :medical_file
  validates :name, presence: true
end
