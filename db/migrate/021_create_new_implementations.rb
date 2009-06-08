class CreateNewImplementations < ActiveRecord::Migration
  def self.up
    create_table :new_implementations do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :new_implementations
  end
end
