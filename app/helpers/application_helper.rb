module ApplicationHelper
  def date_format(date)
    date.strftime('%d-%m-%Y')
  end

  def time_format(date)
    date.strftime('%I:%M %p')
  end
end
