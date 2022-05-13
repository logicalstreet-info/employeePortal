module ApplicationHelper
  def date_format(date)
    date.strftime("%d-%B-%Y")
  end
  
  def time_format(date)
    date.strftime("%I:%M %p")
  end
end