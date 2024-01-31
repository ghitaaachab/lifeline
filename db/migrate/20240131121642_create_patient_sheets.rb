class CreatePatientSheets < ActiveRecord::Migration[7.1]
  def change
    create_table :patient_sheets do |t|
      t.string :blood_type
      t.string :height
      t.string :weight
      t.string :family_history
      t.string :surgical_history
      t.string :emergency_contact_number
      t.string :emergency_contact_name
      t.string :current_dr
      t.string :current_tt
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
