class AddExchangeToLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :logs, :exchange, :date
  end
end
