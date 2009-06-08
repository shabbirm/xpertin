class CreateProfessionalQualifications < ActiveRecord::Migration
  def self.up
    create_table :professional_qualifications do |t|
      t.string :name
      t.integer :sequence
      t.integer :parent_id
      t.boolean :enabled
      
      t.timestamps
    end
  end

  def self.down
    drop_table :professional_qualifications
  end
end
