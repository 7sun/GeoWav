class SessionsController < ApplicationController

  # creates a new session
  def new
  end 

  def create
    user = User.find_by(email: params[:user][:email]) 

    # user exists and password matches that user's password 
    if user && user.authenticate(params[:user][:password]) 
      # resets the session for added security
      reset_session
      # welcomes the user back by referring to their first name
      flash[:success] = "Welcome back, #{user.first_name}!"
      # guarantees that the session[:user_id] will always be a string of the user's id
      session[:user_id] = user.id.to_s 
      # sends user to their profile
      redirect_to root_path
    else
      # alerts that the user has entered an incorrect password and/or username
      flash[:danger] = "Uh oh, incorrect password or username. Try again."
      # redirects user to homepage to sign in again
      redirect_to root_path
    end 
  end 

  # user logs out and session is destroyed
  def destroy
    session[:user_id] = nil
    # alerts the user that the signout has been successful
    flash[:success] = "You have successfully logged out!"
    # redirects user to homepage
    redirect_to root_path
  end 

end 
