class ReportGenerator

   # member wise report
  def ReportGenerator.member_wise_report(criteria)
    Member.find(:all, :conditions => ['created_at between ? AND ?', 
      criteria.from_date, criteria.to_date], :order => 'created_at desc')
  end

  
end
