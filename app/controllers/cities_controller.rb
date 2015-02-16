class CitiesController < ApplicationController

  def new
    @city = City.new
  end 

  def create
    @city = City.new(params.require(:city).permit!)

   if @city.save
      redirect_to root_path
    end 
  end 

end 