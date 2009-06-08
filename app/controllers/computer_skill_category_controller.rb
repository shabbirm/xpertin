class ComputerSkillCategoryController < ApplicationController
  layout 'backend'
active_scaffold :computer_skill_category do | config |
  config.label = "Computer Skill Categories List"
  config.list.columns = [:id,:name,:sequence, :enabled,:created_at,:updated_at]
end

end
