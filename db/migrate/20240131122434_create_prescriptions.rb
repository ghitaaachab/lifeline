class CreatePrescriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :prescriptions do |t|
      t.date :date
      t.string :assigned_dr
      t.string :description
      t.references :medical_file, null: false, foreign_key: true

      t.timestamps
    end
  end
end
