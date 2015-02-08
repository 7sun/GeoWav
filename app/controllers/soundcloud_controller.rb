class SoundcloudController < ApplicationController

  def client
    Soundcloud.new(client_id: ENV["soundcloud_client_id"])
  end
  
  # def users
  #   city = 'Perth'
  #   @embeds = []
  #   @search = SoundcloudSearch.add(city)
  #   @users = @search.result.sort! { |a, b| b['followers_count'] <=> a['followers_count'] }
  #   @users.delete_if { |user| user["city"] != city }
  #   @users = @users.take(10)
  #   @users.each do |user|
  #     @user_track = client.get('/tracks', user_id: user["id"], limit: 1)
  #     if @user_track.first != nil && @user_track.first.embeddable_by == "all"
  #       @embeds << client.get('/oembed', :url => @user_track.first.permalink_url)
  #     end
  #   end
  # end

  def users
    city = 'Perth'
    @streams = []
    @search = SoundcloudSearch.add(city)
    @users = @search.result.sort! { |a, b| b['followers_count'] <=> a['followers_count'] }
    @users.delete_if { |user| user["city"] != city }
    @users = @users.take(20)
    @users.each do |user|
      @user_track = client.get('/tracks', user_id: user["id"], limit: 1)
      @user_track.first
      if @user_track.first != nil
        @streams << @user_track.first
      end
    end
  end

end