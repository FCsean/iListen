class CreatePlaylistsSongs < ActiveRecord::Migration
  
  def self.up
    create_table :playlists_songs, :id => false do |t|
      t.references :song
      t.references :playlist
    end
    add_index :playlists_songs,[:playlist_id, :song_id]
    add_index :playlists_songs, :playlist_id
  end
  
  def self.down
    drop_table :playlists_songs
  end
  
end
