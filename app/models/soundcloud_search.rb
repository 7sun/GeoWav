class SoundcloudSearch < ActiveRecord::Base

  serialize :result, JSON
  
  def self.client
    Soundcloud.new(client_id: ENV["soundcloud_client_id"])
  end

  def self.add(string)
    if search = SoundcloudSearch.find_by(query: string)
      if search.updated_at < 10.minutes.ago # WAS not created within the last 10 minutes
        users = client.get('/users', q: string, limit: 100)
        search.update_attributes(result: users, updated_at: Time.now)
      end
    else #Does NOT exist in DB
      users = client.get('/users', q: string, limit: 100)
      search = SoundcloudSearch.create(query: string, result: users)
    end
    search
  end


end
