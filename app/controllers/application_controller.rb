class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # checks to see there is a user/someone has signed in
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id]) 
    else 
    @current_user = nil
    end 
    return @current_user
 end 

  # allows access to this method in the view file
  helper_method :current_user 

  # only allows access to app when user has signed up and signed in
  def authorize
    redirect_to root_path unless current_user
  end 

end