class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.integer :car_id
      t.integer :part_id

      t.timestamps
    end
  end
end
