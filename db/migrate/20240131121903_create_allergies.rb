class CreateAllergies < ActiveRecord::Migration[7.1]
  def change
    create_table :allergies do |t|
      t.string :type
      t.references :patient_sheet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
