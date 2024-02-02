class VitalSign < ApplicationRecord
  belongs_to :user
  validates :label, presence: true, inclusion: { in: ["Blood Pressure", "Heart Rate", "Temperature", "Blood Sugar"] }
  validates :value, presence: true, numericality: { greater_than: 0 }
end
