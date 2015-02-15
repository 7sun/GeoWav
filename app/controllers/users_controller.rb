class UsersController < ApplicationController

  def new
    @user = User.new
  end 

  def create
    @user = User.new(params.require(:user).permit!)
    @user.favorites = []
    
    if @user.save
      session[:user_id] = @user.id.to_s
      flash[:info] = "Welcome! Start adding songs to your favorites!"
      redirect_to root_path
    else
      flash.now[:danger] = @user.errors.full_messages.to_sentence
      redirect_to root_path
    end 


  end 

end
