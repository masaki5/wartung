class AddCarInspectionToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :car_inspection, :date
  end
end
