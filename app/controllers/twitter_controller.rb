class TwitterController < ApplicationController
  
  def index
    @search = TwitterSearch.add("kanye")
    @tweets = @search.result
  end

  
end
