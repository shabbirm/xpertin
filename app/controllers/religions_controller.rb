class ReligionsController < ApplicationController
   layout 'backend'
 active_scaffold :religions do | config |
  config.label = "Religions List"
  config.list.columns = [:id,:name, :enable,:created_at,:updated_at]
 end
end
