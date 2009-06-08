class IndustryController < ApplicationController
  layout 'backend'

active_scaffold :industry do | config |
  config.label = "Industries List"
  config.list.columns = [:id,:name,:sequence, :enabled,:created_at,:updated_at]

end

end
