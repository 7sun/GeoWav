class UsersController < ApplicationController

  def new
    @user = User.new
  end 

  def create
    @user = User.new(params.require(:user).permit!)
    
    if @user.save
      redirect_to :twitter
    else
      render :new
    end 


  end 

end
