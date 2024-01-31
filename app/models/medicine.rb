class Medicine < ApplicationRecord
  belongs_to :user
  validates :name, :start_date, :end_date, presence: true
end
