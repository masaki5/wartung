class CreateParts < ActiveRecord::Migration[5.2]
  def change
    create_table :parts do |t|
      t.string :name
      t.string :introduction
      t.integer :car_id

      t.timestamps
    end
  end
end
