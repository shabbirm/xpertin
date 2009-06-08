class ProfessionalQualificationController < ApplicationController
  layout 'backend'
  active_scaffold :professional_qualification do | config |
    config.label = "Professional Qualification List"
    config.list.columns = [:id,:name,:sequence,:parent_id,:enabled,:created_at,:updated_at]
  end
end
