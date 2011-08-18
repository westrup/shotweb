module ApplicationHelper
  def date_interval(start_date, end_date)
    if start_date.year == end_date.year
      if start_date.month == end_date.month
        if start_date.day == end_date.day
          start_date.strftime('%b %e')
        else
          start_date.strftime('%b %e') + end_date.strftime(' - %e')
        end
      else
          start_date.strftime('%b %e') + end_date.strftime(' - %b %e')        
      end
    else
      start_date.strftime('%F') + end_date.strftime(' - %F')
    end
  end
end
