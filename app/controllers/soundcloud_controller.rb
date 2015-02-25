class SoundcloudController < ApplicationController

  def playlist
    city = params[:city]
    @search = SoundcloudSearch.add(city)
    @streams = @search.tracks
    render json: @streams
  end

private

  def client
    Soundcloud.new(client_id: ENV["soundcloud_client_id"])
  end

end
