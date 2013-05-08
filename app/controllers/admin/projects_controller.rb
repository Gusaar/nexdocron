class Admin::ProjectsController < AdminController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    init_variables
  end

  def create
    @project = Project.new
    @project.attributes = params[:project]

    if @project.valid? && @project.save
      redirect_to admin_projects_path, :notice => "Project created successfully."
    else
      init_variables
      flash[:error] = "Project couldn't be created."
      render new_admin_project_path
    end
  end

  def edit
    @project = Project.find_by_id(params[:id])
    init_variables
  end

  def update
    @project = Project.find_by_id(params[:id])

    @project.attributes = params[:project]

    if @project.valid? && @project.save
      redirect_to admin_projects_path, :notice => "Project updated successfully."
    else
      init_variables
      flash[:error] = "Project couldn't be updated."
      render :action => :edit, :id => @project.id
    end
  end

  def show
    @project = Project.find_by_id(params[:id])
  end

  def destroy
    @project = Project.find_by_id(params[:id])

    if @project && @project.destroy
      redirect_to admin_projects_path, :notice => "Project destroyed successfully."
    else
      flash[:error] = "Project couldn't be destroyed."
      render admin_project_path(@project.id)
    end
  end

  private

  def init_variables
    @clients = Client.all
    @users = User.all
    @invoicing_types = InvoicingType.all
  end
end
