class HoursController < ApplicationController

  def index
    @projects = current_user.projects
    @week_days = get_week_days(Date.today)
    @selected = Date.today.day
  end

  def update_week
    date = Date.parse(params['date'])
    @week_days = get_week_days(date)
    @selected = date.day
  end

  def update_project_hours
    date = Date.parse(params['date'])
    range = get_range(date)
    @project_hours = @projects.hours.where('date IN (?)', range)
  end

  private

  def get_week_days(date)
    days = []

    week_start, week_end = get_range(date)
    week_start.upto(week_end).each do |d|
      days << (d.month == date.month ? d.day : 0)
    end
    days
  end

  def get_range(date)
    week_start = Date.commercial(date.cwyear, date.cweek, 1) - 1.day
    week_end = Date.commercial(date.cwyear, date.cweek, 7) - 1.day
    [ week_start, week_end ]
  end
end
