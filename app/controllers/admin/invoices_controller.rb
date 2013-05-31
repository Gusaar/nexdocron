class Admin::InvoicesController < AdminController
  skip_load_and_authorize_resource
  before_filter { authorize! :read, :invoices }

  def index
    @clients = Client.all
  end

  def download
    if params[:report_type] == '1'
      @users = User.all
      @start_date = Date.parse(params[:start_date])
      @end_date = Date.parse(params[:end_date])
    else
      @client = Client.find_by_id(params[:client_id])
      @start_date = Date.parse(params[:start_date])
      @end_date = Date.parse(params[:end_date])
    end
    
    respond_to do |format|
      format.xls { render action: params[:report_type] == '1' ? 'overall' : 'per_client' }
    end
  end
end
