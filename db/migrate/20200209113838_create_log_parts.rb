class CreateLogParts < ActiveRecord::Migration[5.2]
  def change
    create_table :log_parts do |t|
      t.references :log, foreign_key: true
      t.references :part, foreign_key: true

      t.timestamps
    end
  end
end
