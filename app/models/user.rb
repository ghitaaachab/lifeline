class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :vital_signs
  has_many :symptoms
  has_many :appointments
  has_many :medical_files
  has_many :medicines
  has_one :patient_sheet
  has_one_attached :photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
