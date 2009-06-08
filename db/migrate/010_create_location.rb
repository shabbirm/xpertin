class CreateLocation < ActiveRecord::Migration
  def self.up
    
    create_table :locations do |t|
      t.string :name
      t.integer :region_id
      t.boolean :enabled
      t.timestamps
    end
    
  end

  def self.down
    drop_table :locations
  end
end
