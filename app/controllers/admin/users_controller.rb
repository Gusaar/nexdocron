class Admin::UsersController < AdminController

  def index
    @users = User.all
  end

  def new
    @user = User.new
    @user_types = UserType.all
  end

  def create
    @user = User.new
    user_type = params[:user][:user_type]
    params[:user].delete(:user_type)
    @user.user_type_id = user_type

    @user.attributes = params[:user]

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

    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    unless @user.user_type_id == params[:user][:user_type]
      user_type = params[:user][:user_type]
      params[:user].delete(:user_type)
      @user.user_type_id = user_type
    end

    @user.attributes = params[:user]

    if @user.valid? && @user.save
      redirect_to admin_users_path, :notice => "User updated successfully."
    else
      @user_types = UserType.all

      flash[:error] = "User couldn't be updated."
      render :action => :edit, :id => @user.id
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
