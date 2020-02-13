class RemovePartIdFromLogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :logs, :part_id, :integer
  end
end
