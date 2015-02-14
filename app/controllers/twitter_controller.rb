class TwitterController < ApplicationController
  
  def index
    @search = TwitterSearch.add("kanye")
    @tweets = @search.result
  end

  def tweets
    artist = params[:artist]
    @search = TwitterSearch.add(artist)
    @tweets = @search.result
    render json: @tweets
  end

  
end
