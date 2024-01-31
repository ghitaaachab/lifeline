class CreateMedicines < ActiveRecord::Migration[7.1]
  def change
    create_table :medicines do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.string :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
