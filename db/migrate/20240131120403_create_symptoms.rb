class CreateSymptoms < ActiveRecord::Migration[7.1]
  def change
    create_table :symptoms do |t|
      t.string :description
      t.date :start_date
      t.date :end_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
