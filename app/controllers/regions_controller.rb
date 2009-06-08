class RegionsController < ApplicationController
  layout 'backend'
 active_scaffold :regions do | config |
  config.label = "Regions List"
  config.list.columns = [:id,:name, :sequence,:created_at,:updated_at]
end

  def add_region
    debugger
    @region=Region.new
    @region.name = params[:region][:name]
    @region.save
   
  if @region.save
      @region=Region.find(:all)
      respond_to do |format|
        format.html do
          flash[:notice] = l(:notice_successful_create)
            #redirect_to :action => 'settings', :tab => 'categories', :id => @project
           redirect_to :controller => 'new_implementations', :action => 'add_regions_throught_javascript'
        end
        format.js do
          # IE doesn't support the replace_html rjs method for select box options
          render(:update) {|page| page.replace "new_implementations_region_id",
           content_tag('select', '<option></option>' + options_from_collection_for_select(@region, 'id', 'name', @region.id), :id => 'new_implementations_region_id', :name => 'new_implementations[region_id]')
          }
        end
      end
   end
 end
 
end
