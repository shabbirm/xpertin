class ComputerSkillController < ApplicationController
    layout 'backend'
active_scaffold :computer_skill do | config |
  config.label = "Computer Skill List"
  config.list.columns = [:id,:name,:sequence,:computer_skill_categories_id,:enabled,:created_at,:updated_at]
end
end
