class TwitterSearch < ActiveRecord::Base

  serialize :result, Array

  def self.add(string)
    # checks database to see if a previous query has been stored for the requested artist
    if search = TwitterSearch.find_by(query: string) 
      if search.updated_at < 10.minutes.ago #Was NOT created in the last 10 minutes
        search_results = $twitter_rest.search(string, lang: "en").take(20)
        search.update_attributes(result: search_results, updated_at: Time.now)
      end 
    else  #Artist does not currently exist in the database
      search_results = $twitter_rest.search(string, lang: "en").take(20)
      search = TwitterSearch.create(query: string, result: search_results)
    end
    search
  end 

end 
