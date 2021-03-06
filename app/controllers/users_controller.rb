class UsersController < ApplicationController
  
  skip_before_filter :authenticated, :only => [:new, :create]
  
  def new
    @user = User.new
  end
  
  def create
    user = User.new(params[:user])
    if user.save
      session[:id] = user.id
      redirect_to home_dashboard_index_path
    else
      @user = user
      render :new
    end
  end
  
  def account_settings
    @user = current_user
  end
  
  def update
    current_user.update_attributes(params[:user].reject { |k| k == "password" })
    pass = params[:user][:password]
    current_user.password = pass if !(pass.blank?)
    current_user.save!
    redirect_to user_account_settings_path(:user_id => current_user.id)
  end
  
end
