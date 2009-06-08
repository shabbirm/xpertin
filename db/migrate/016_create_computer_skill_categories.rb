class CreateComputerSkillCategories < ActiveRecord::Migration
  def self.up
    create_table :computer_skill_categories do |t|
      t.string :name
      t.integer :sequence
      t.boolean :enabled
      t.timestamps
    end
  end

  def self.down
    drop_table :computer_skill_categories
  end
end
