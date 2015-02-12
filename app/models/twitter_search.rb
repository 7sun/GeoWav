class TwitterSearch < ActiveRecord::Base

  serialize :result, Array

  def self.add(string)
    if search = TwitterSearch.find_by(query: string) 
      if search.updated_at < 10.minutes.ago 
        search_results = $twitter_rest.search(string, lang: "en").take(25)
        search.update_attributes(result: search_results, updated_at: Time.now)
      end 
    else  
      search_results = $twitter_rest.search(string, lang: "en").take(25)
      search = TwitterSearch.create(query: string, result: search_results)
    end
    search
  end 

end 
