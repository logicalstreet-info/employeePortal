module UpdatesHelper
  def total_time(in_time, out_time)
    ((out_time - in_time) / 3600).round
  end
end
