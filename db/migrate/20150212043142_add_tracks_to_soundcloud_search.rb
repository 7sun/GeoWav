class AddTracksToSoundcloudSearch < ActiveRecord::Migration
  def change
    add_column :soundcloud_searches, :tracks, :string
  end
end
