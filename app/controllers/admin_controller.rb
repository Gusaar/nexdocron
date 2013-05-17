class AdminController < ApplicationController
  load_and_authorize_resource
  
  def index
    @date = DateTime.now
    @users = User.with_missing_hours_in_month(@date)
  end

  def update_users_with_missing_hours
    @date = Date.parse(params[:date])
    @users = User.with_missing_hours_in_month(@date)
  end
end
