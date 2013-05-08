class Admin::ReportsController < AdminController

  def index
    @projects = Project.all
  end
end
