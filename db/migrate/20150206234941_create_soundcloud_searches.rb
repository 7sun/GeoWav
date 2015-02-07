class CreateSoundcloudSearches < ActiveRecord::Migration
  def change
    create_table :soundcloud_searches do |t|
      t.string :query
      t.string :result

      t.timestamps null: false
    end
  end
end