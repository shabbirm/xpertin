class Industry < ActiveRecord::Base
  validates_presence_of :name

  def Industry.list
    Industry.find(:all, :conditions => ['enabled = ?', true], :order => 'sequence')
  end
end
