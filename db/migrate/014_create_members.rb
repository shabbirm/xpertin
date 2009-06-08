class CreateMembers < ActiveRecord::Migration
  def self.up
     create_table :members do |t|
    
      t.column :member_id,   :integer
      t.column :name,        :string,   :limit => 30, :null => false
      t.column :email,       :string
      t.column :address,     :string
      t.column :login_name,  :string
      t.column :password,    :string
      t.column :fax,         :string
      t.column :country,     :string
      t.column :state,       :string
      t.column :phone,       :integer     
      t.column :enabled,     :boolean,   :default => true
        
      t.column :photo,       :binary,     :limit => 2.megabytes
      t.column :thumbnail,   :binary,     :limit => 256.kilobytes
      t.column :dob,         :date,      :null => false
      t.column :notes,       :text
      t.column :created_at,  :timestamp
      t.column :updated_at,  :timestamp

    end
  end

  def self.down
    drop_table "members"
  end
end
