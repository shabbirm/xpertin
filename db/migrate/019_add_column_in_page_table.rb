class AddColumnInPageTable < ActiveRecord::Migration
  def self.up
    add_column :pages, :name, :string
    add_column :pages, :parent_id, :integer
    add_column :pages, :sequence, :integer
    add_column :pages, :url, :string
  end

  def self.down
    remove_column :pages, :name
    remove_column :pages, :parent_id
    remove_column :pages, :sequence
    remove_column :pages, :url
  end
end
