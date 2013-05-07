class HoursController < ApplicationController

  def index
    @projects = current_user.projects
    @date = Date.today
    @week_days = get_week_days(@date)
    @selected = @date.day

    get_month_hours(@projects, @date.beginning_of_month, @date.end_of_month)
    get_week_hours(@date, params[:project_id], @projects)
  end

  def update_week
    @date = Date.parse(params['date'])
    @project_id = params[:project_id]

    load_default_variables
  end

  def update_hour
    @date = Date.parse(params['date'])
    @created = false
    if params[:project_id] && @project = Project.find_by_id(params[:project_id])
      @project_id = params[:project_id]
      if params[:hour_id] && @hour = current_user.hours.find_by_id(params[:hour_id])
        @hour.update_attributes(:tasks_description => params[:description],
                                :total_hours      => params[:hours])
      else
        @created = true
        @hour = current_user.hours.create(:project => @project,
                                          :tasks_description => params[:description],
                                          :total_hours      => params[:hours],
                                          :date             => @date)
      end

      load_default_variables
    end
  end

  def get_hours_info
    @hour = Hour.find_by_id(params[:id])

    respond_to do |format|
      format.json { render :json => { hours: @hour.total_hours, description: @hour.tasks_description } }
    end
  end

  def delete_hour
    @hour = Hour.find_by_id(params[:id])
    @project_id = @hour.project_id
    @date = Date.parse(@hour.date.strftime('%d-%m-%Y'))
    @id = @hour.id

    @hour.destroy

    load_default_variables
  end

  private

  def get_month_hours(projects, start_date, end_date)
    @month_hours = projects.collect do |p|
      p.hours.where('date BETWEEN ? AND ?', start_date.beginning_of_day, end_date.end_of_day).collect{|h| h.total_hours}
    end.flatten.sum
    @month_total_hours = (start_date..end_date).to_a.reject{ |d| d.saturday? || d.sunday? }.count * 8
  end

  def get_week_hours(date, project_id, projects)
    @week_days = get_week_days(date)
    range = get_range(date)

    @project_hours = []
    @week_total_hours = {}
    @week_all_hours = {}
    projects.collect do |p|
      p.hours.where('date BETWEEN ? AND ?', range.first.beginning_of_day, range.last.end_of_day)
    end.flatten.each do |h|
      if h.project.id == project_id.to_i
        @project_hours << h
      end

      @week_total_hours["#{h.date.day}"] ||= 0
      @week_total_hours["#{h.date.day}"] += h.total_hours

      @week_all_hours["#{h.date.day}"] ||= []
      @week_all_hours["#{h.date.day}"] << h
    end
  end

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

  def load_default_variables
    projects = current_user.projects
    get_month_hours(projects, @date.beginning_of_month, @date.end_of_month)
    get_week_hours(@date, @project_id, projects)
  end
end
