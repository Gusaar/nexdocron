class Admin::InvoicesController < AdminController
  skip_load_and_authorize_resource
  before_filter { authorize! :read, :reports }

  def download
    @users = User.all
    @start_date = Date.parse(params[:start_date])
    @end_date = Date.parse(params[:end_date])
    
    respond_to do |format|
      format.xls
    end
  end
end
