class TwitterController < ApplicationController
  
  def tweets
    artist = params[:artist]
    @search = TwitterSearch.add(artist)
    @tweets = @search.result
    render json: @tweets
  end

end
