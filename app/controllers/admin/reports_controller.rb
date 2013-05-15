class Admin::ReportsController < AdminController
  skip_load_and_authorize_resource
  before_filter { authorize! :read, :reports }

  def index
    @projects = Project.all
  end

  def generate_report
    @project = Project.find_by_id(params[:project_id])
    @start_date = Date.parse(params[:start_date])
    @end_date = Date.parse(params[:end_date])
    @report = @project.hours.where('date BETWEEN ? AND ?', @start_date.beginning_of_day, @end_date.end_of_day).order('date DESC').group_by(&:user) 
  end

  def pdf
    generate_report
    
    respond_to do |format|
      format.pdf do
        render :pdf => "filename"
      end
    end
  end
end
