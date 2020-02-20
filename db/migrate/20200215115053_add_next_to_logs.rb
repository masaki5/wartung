class AddNextToLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :logs, :next, :date
    add_column :logs, :after, :integer
  end
end
