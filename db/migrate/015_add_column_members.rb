class AddColumnMembers < ActiveRecord::Migration
  def self.up
    add_column :members, :docs, :binary,     :limit => 5.megabytes
  end

  def self.down
    remove_column :members, :docs
  end
end
