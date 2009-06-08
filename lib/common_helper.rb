module CommonHelper
  def format_date_iso(date)
    date.strftime('%Y%m%d')
  end

  def format_date(date)
    date.strftime('%Y-%m-%d')
  end
  
  def format_date_time(date)
    date.strftime('%Y-%m-%d %I:%M %p')
  end

  def format_time(date)
    date.strftime('%I:%M %p')
  end

  def format_month_year(date)
        date.strftime('%B %Y')
  end

  def format_month_date(date)
        date.strftime('%B %d, %Y')
  end

end
