class Admin::UsersController < AdminController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_id(params[:id])
    @user.attributes = params[:user]

    if @user.valid? && @user.save
      redirect_to admin_users_path, :notice => "User created successfully."
    else
      flash[:error] = "User couldn't be created."
      render new_admin_user_path
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    @user.attributes = params[:user]

    if @user.valid? && @user.save
      redirect_to admin_users_path, :notice => "User updated successfully."
    else
      flash[:error] = "User couldn't be updated."
      render edit_admin_user_path(@user.id)
    end
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def destroy
    @user = User.find_by_id(params[:id])

    if @user && @user.destroy
      redirect_to admin_users_path, :notice => "User destroyed successfully."
    else
      flash[:error] = "User couldn't be destroyed."
      render admin_user_path(@user.id)
    end
  end
end
