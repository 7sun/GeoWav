class SoundcloudSearch < ActiveRecord::Base

  serialize :result, JSON
  serialize :tracks, JSON
  
  def self.add(city)
    # checks database to see if a previous query has been stored for the requested city
    if search = SoundcloudSearch.find_by(query: city)
      if search.updated_at < 30.minutes.ago # Was NOT created within the last 30 minutes
        users = client.get('/users', q: city, limit: 100)
        tracks = getTrack(users, city)
        search.update_attributes(result: users, tracks: tracks, updated_at: Time.now)
      end
    else #Does NOT exist in DB
      users = client.get('/users', q: city, limit: 100)
      tracks = getTrack(users, city)
      search = SoundcloudSearch.create(query: city, result: users, tracks: tracks)
    end
    search
  end

  def self.getTrack(users, city)
    # gets the most recent track by each valid soundcloud user
    tracks = []
    # Sorts users list by follower count
    users = users.sort! { |a, b| b['followers_count'] <=> a['followers_count'] }
    users.delete_if { |user| user['city'] != city }
    users = users.take(10)
    users.each do |user|
      user_track = client.get('/tracks', user_id: user["id"], limit: 1)
      user_track.first
      if user_track.first != nil
        tracks << user_track.first
      end
    end
    tracks
  end

private

  def self.client
    Soundcloud.new(client_id: ENV["soundcloud_client_id"])
  end


end
