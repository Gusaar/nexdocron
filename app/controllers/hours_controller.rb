class HoursController < ApplicationController

  def index
    @projects = current_user.projects
    @week_days = get_week_days(Date.today)
    @selected = Date.today.day
  end

  def update_week
    date = Date.parse(params['date'])
    @week_days = get_week_days(date)

    if params[:project_id] && @project = Project.find_by_id(params[:project_id])
      range = get_range(date)
      @project_hours = @project.hours.where('date BETWEEN ? AND ?', range.first.beginning_of_day, range.last.end_of_day)
    end
  end

  def update_hour
    date = Date.parse(params['date'])
    if params[:project_id] && @project = Project.find_by_id(params[:project_id])
      if params[:hour_id] && @hour = current_user.hours.find_by_id(params[:hour_id])
        @hour.update_attributes(:tasks_description => params[:description],
                                :total_hours      => params[:hours])
      else
        current_user.hours.create(:project => @project,
                                  :tasks_description => params[:description],
                                  :total_hours      => params[:hours],
                                  :date             => date)
      end
      update_week

      render 'update_week', format: :js
    end
  end

  def get_hours_info
    @hour = Hour.find_by_id(params[:id])

    respond_to do |format|
      format.json { render :json => { hours: @hour.total_hours, description: @hour.tasks_description } }
    end
  end

  private

  def get_week_days(date)
    days = []

    range = get_range(date)
    range.each do |d|
      days << (d.month == date.month ? d.day : 0)
    end
    days
  end

  def get_range(date)
    if date.sunday?
      date += 1.day
    end

    week_start = Date.commercial(date.cwyear, date.cweek, 1) - 1.day
    week_end = Date.commercial(date.cwyear, date.cweek, 7) - 1.day

    (week_start.. week_end).to_a
  end
end
