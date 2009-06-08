class LocationController < ApplicationController
layout 'backend'

active_scaffold :location do | config |
  config.label = "Locations Detail List"
  config.list.columns = [:id,:name,:region_id, :enabled,:created_at,:updated_at]
end

end
