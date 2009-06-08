class ComputerSkill < ActiveRecord::Base
  
  validates_presence_of :name, :sequence, :computer_skill_category_id
  validates_numericality_of :sequence
  belongs_to :computer_skill_category
  
  def ComputerSkill.list
    ComputerSkillCategory.find(:all, :order => 'sequence', :conditions => ['enabled = ?', true])
  end

  def desc
    computer_skill_category.name + ' : ' + name
  end
  
end
