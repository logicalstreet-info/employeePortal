module LeaveApplicationsHelper
  
  def date_format(date)
    date.strftime("%d-%B-%Y")
  end

  def time_format(date)
    date.strftime("%I:%M %p")
  end

  # def total_day(from_time,to_time)
  #   strat = from_time.strftime("%d-%B-%Y")
  #   stop = to_time.strftime("%d-%B-%Y") 

  #   for i in start...stop
  #   end 
  # end

  #   total = ((to_time - from_time) / 1.day).round
  #   total.times do 
  #     if total.wday == 0
  #       ((to_time - from_time) / 1.day).round
  #     else
  #       ((to_time - from_time) / 1.day + 1).round
  #     end
  #   end
  # end
end
