class AddPartIdToLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :logs, :part_id, :integer
  end
end
