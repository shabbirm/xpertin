class ComputerSkillCategory < ActiveRecord::Base
  validates_presence_of :name, :sequence
  validates_numericality_of :sequence
  has_many :computer_skills, :order => 'sequence'

  def ComputerSkillCategory.list
    ComputerSkillCategory.find(:all, :order => 'sequence', :conditions => ['enabled = ?', true])
  end
end
