class CreateUserreports < ActiveRecord::Migration[7.1]
  def change
    create_table :userreports do |t|

      t.timestamps
    end
  end
end
