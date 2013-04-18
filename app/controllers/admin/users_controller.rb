class Admin::UsersController < AdminController

  def index
    @users = User.all
  end

  def new
    @user = User.new
    @user_types = UserType.all
  end

  def create
    @user = User.find_by_id(params[:id])
    user_type = params[:user][:user_type_id]
    params[:user].delete(:user_type_id)

    @user.attributes = params[:user]
    @user.user_type_id = user_type

    if @user.valid? && @user.save
      redirect_to admin_users_path, :notice => "User created successfully."
    else
      @user_types = UserType.all

      flash[:error] = "User couldn't be created."
      render new_admin_user_path
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
    @user_types = UserType.all
  end

  def update
    @user = User.find_by_id(params[:id])
    user_type = params[:user][:user_type_id]
    params[:user].delete(:user_type_id)

    @user.attributes = params[:user]
    @user.user_type_id = user_type

    if @user.valid? && @user.save
      redirect_to admin_users_path, :notice => "User updated successfully."
    else
      @user_types = UserType.all

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
