class Appointment < ApplicationRecord
  belongs_to :user
  validates :doctor_name, :date, presence: true
end
