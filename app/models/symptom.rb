class Symptom < ApplicationRecord
  belongs_to :user
  validates :description, :start_date, :end_date, presence: true
end
