class ApplicationController < ActionController::Base

  before_filter :authenticated
  helper_method :current_user
  
  # Our security guy keep talking about sea-surfing, cool story bro.
  # protect_from_forgery
  
  private

  def current_user
    @current_user ||= User.find_by_id(session[:id].to_s)
  end
  
  def authenticated
     redirect_to root_url and reset_session if not current_user
  end

end
