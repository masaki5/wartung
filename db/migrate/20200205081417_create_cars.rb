class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :name
      t.integer :mileage
      t.date :register
      t.date :inspection
      t.string :user_id

      t.timestamps
    end
  end
end