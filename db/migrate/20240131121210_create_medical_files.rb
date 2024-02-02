class CreateMedicalFiles < ActiveRecord::Migration[7.1]
  def change
    create_table :medical_files do |t|
      t.string :name
      t.string :description
      t.string :treating_dr
      t.string :file_id
      t.date :date
      t.string :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
