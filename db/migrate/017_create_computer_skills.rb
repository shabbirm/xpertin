class CreateComputerSkills < ActiveRecord::Migration
  def self.up
    
    create_table :computer_skills do |t|
      t.string :name
      t.integer :sequence
      t.boolean :enabled
      t.integer :computer_skill_categories_id
      t.timestamps
    end
    
  end

  def self.down
    drop_table :computer_skills
  end
end
