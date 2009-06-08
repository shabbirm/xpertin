class Region < ActiveRecord::Base
  validates_presence_of :name
  has_many :locations, :order => 'name'

  def Region.list
    Region.find(:all, :order => 'name')
  end
end
