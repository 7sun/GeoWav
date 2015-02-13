module Api
  class PlaylistsController < ApplicationController
    protect_from_forgery with: :null_session

    def index
      playlists = SoundcloudSearch.all
      render json: playlists.to_json,
      except: [:id],
        include: {
          result: { except: [:id] }
        }
    end

  end
end