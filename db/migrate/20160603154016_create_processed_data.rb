class CreateProcessedData < ActiveRecord::Migration
  def self.up
    create_table :processed_data do |t|
      t.string :period_label
      t.string :begin
      t.string :end

      t.timestamps
    end
  end

  def self.down
    drop_table :processed_data
  end
end
