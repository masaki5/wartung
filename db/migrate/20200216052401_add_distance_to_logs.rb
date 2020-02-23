class AddDistanceToLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :logs, :distance, :integer
  end
end
