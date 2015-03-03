class PlaylistsController < ApplicationController
  before_filter :logged_in?
  
  def playlist_params
    params.require(:playlist).permit(:name)
  end
  
  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user = current_user
    if @playlist.save
      redirect_to "/playlist/"+@playlist.name, :notice => "Created!"
    else
      render "playlists"
    end
  end
  
  def playlists
    @playlist = Playlist.new
    @playlists = current_user.playlists
  end
  
  def playlist
    @playlist = current_user.playlists.where(name: params[:name]).to_a
    if @playlist.length == 0
      redirect_to '/playlists/'
      return
    end
    @playlist = @playlist.first
    @songs = @playlist.songs
    gon.songs = current_user.songs.map { |s| {"artist"=>s.artist, "title"=>s.title, "id"=>s.id, "url"=>s.song.url}}
  end
  
  def add
    playlist = Playlist.where(name: params[:playlist_name]).to_a.first
    song = Song.find(params[:song_id])
    playlist.songs << song
  end
end