module UpdatesHelper

  def date_format(date)
    date.strftime("%d-%B-%Y")
  end

  def time_format(date)
    date.strftime("%I:%M %p")
  end

  def total_time(in_time,out_time)
    ((out_time - in_time) / 3600).round
  end
end
