module HoursHelper

  def footer_color_by_hours(hours, date)
    total = hours.to_f
    d = Date.parse(date)

    if d <= Date.today
      case
      when total < 8.0 then
        'warning'
      when total == 8.0 then
        'good'
      when total > 8.0 then
        'over'
      end
    end
  end

  def month_color_by_hours(hours, total_hours)
    case
    when hours < total_hours then
      'warning'
    when hours == total_hours then
      'good'
    else
      'over'
    end
  end
end
