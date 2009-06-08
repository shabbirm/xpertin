class PageContentsController < ApplicationController
 layout 'default'
  def view
    begin
      @page = Page.find_by_name(params[:id].to_s)
    rescue
      logger.error 'Error loading page. ' + $!.to_s
      flash.now[:error] = 'Page Not Found'
    end
    render :action => 'view', :layout => 'default'
  end
  
end
