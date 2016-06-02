class CreateRawData < ActiveRecord::Migration
  def self.up
    create_table :raw_data do |t|
      t.text :timestamp
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :raw_data
  end
end
