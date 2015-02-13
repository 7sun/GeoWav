class SoundcloudController < ApplicationController

  def client
    Soundcloud.new(client_id: ENV["soundcloud_client_id"])
  end
  
  def users
    city = 'Los Angeles'
    @search = SoundcloudSearch.add(city)
    @streams = @search.tracks
    @test_track = @search.tracks.first['uri']
  end

end
