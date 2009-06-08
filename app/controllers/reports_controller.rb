class ReportsController < ApplicationController
  layout 'backend'
 def member_wise_report
    if request.post? 
      @criteria = DynaBean.new(params[:criteria])
      if @criteria.validate(['from_date', 'to_date'])
        @members = ReportGenerator.member_wise_report(@criteria)
        flash.now[:notice] = 'no_matches_found' if @members.size == 0
      end
    end
  end 
  
end
