class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

   def index
    # @search_results = $twitter_rest.search("#justintimberlake", geocode: "34.03093,-118.26664119999998,500mi", lang: "en").take(10)
    @search = TwitterSearch.add("kanye")
    @tweets = @search.result
    # @users = $twitter_rest.user_search("Lebron James")
    # @topics = ['obama','bieber']
    #   $twitter_stream.filter(track: @topics.join(",")) do |object|
    #     if object.is_a? (Twitter::Tweet)
    #       puts object.text
    #     end
    #    end
    end

end

# get request with angular?
# https://egghead.io/lessons/angularjs-http