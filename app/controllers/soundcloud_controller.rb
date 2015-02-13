class SoundcloudController < ApplicationController

  def client
    Soundcloud.new(client_id: ENV["soundcloud_client_id"])
  end
  
  def users
    city = 'New York'
    @search = SoundcloudSearch.add(city)
    @streams = @search.tracks
    @test_track = @search.tracks.first['uri']
  end

  def playlist
    city = params[:city]
    @search = SoundcloudSearch.add(city)
    @streams = @search.tracks
    render json: @streams
  end

end
