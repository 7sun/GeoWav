class SoundcloudSearch < ActiveRecord::Base

  serialize :result, JSON
  serialize :tracks, JSON
  
  def self.client
    Soundcloud.new(client_id: ENV["soundcloud_client_id"])
  end

  def self.add(city)
    if search = SoundcloudSearch.find_by(query: city)
      if search.updated_at < 10.minutes.ago # WAS not created within the last 10 minutes
        users = client.get('/users', q: city, limit: 100)
        tracks = getTrack(users)
        search.update_attributes(result: users, tracks: tracks, updated_at: Time.now)
      end
    else #Does NOT exist in DB
      users = client.get('/users', q: city, limit: 100)
      users = users.sort! { |a, b| b['followers_count'] <=> a['followers_count'] }
      users.delete_if { |user| user['city'] != city }
      users = users.take(10)
      tracks = getTrack(users)
      search = SoundcloudSearch.create(query: city, result: users, tracks: tracks)
    end
    search
  end

  def self.getTrack(users)
    tracks = []
    users.each do |user|
      user_track = client.get('/tracks', user_id: user["id"], limit: 1)
      user_track.first
      if user_track.first != nil
        tracks << user_track.first
      end
    end
    puts tracks
    tracks
  end


end
