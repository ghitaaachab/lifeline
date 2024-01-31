class CreateVitalSigns < ActiveRecord::Migration[7.1]
  def change
    create_table :vital_signs do |t|
      t.string :label
      t.string :value
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
