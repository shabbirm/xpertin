class PagesController < ApplicationController
  # GET /pages
  # GET /pages.xml
  layout 'backend'
  active_scaffold :page do | config |
    config.label = "Page Detail List"
    config.list.columns = [:id,:name,:title, :body,:parent_id,:sequence,:url,:created_at]
  end

  
end
