class Admin::ClientsController < AdminController
  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new
    
    @client.attributes = params[:client]

    if @client.valid? && @client.save
      redirect_to admin_clients_path, :notice => "Client created successfully."
    else
      flash[:error] = "Client couldn't be created."
      render new_admin_client_path
    end
  end

  def edit
    @client = Client.find_by_id(params[:id])
  end

  def update
    @client = Client.find_by_id(params[:id])

    @client.attributes = params[:client]

    if @client.valid? && @client.save
      redirect_to admin_clients_path, :notice => "Client updated successfully."
    else
      flash[:error] = "Client couldn't be updated."
      render :action => :edit, :id => @client.id
    end
  end

  def show
    @client = Client.find_by_id(params[:id])
  end

  def destroy
    @client = Client.find_by_id(params[:id])

    if @client && @client.destroy
      redirect_to admin_clients_path, :notice => "Client destroyed successfully."
    else
      flash[:error] = "Client couldn't be destroyed."
      render admin_client_path(@client.id)
    end
  end
end
