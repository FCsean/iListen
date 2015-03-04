class SongsController < ApplicationController
  before_filter :logged_in?
  def song_params
    params.require(:song).permit(:title, :artist, :song, :user)
  end
  
  def create
    @song = Song.new(song_params)
    @song.set_user(current_user)
    if @song.save
      redirect_to root_url, :notice => "Uploaded!"
    else
      render "upload"
    end
  end

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.

  
  def upload
    @user = current_user
    @song = Song.new
  end
  
  def player
    @user = current_user
    @songs = @user.songs
    gon.songs = @songs.map { |s| {"title"=>s.title, "artist"=>s.artist, "url"=>s.song.url, "id"=>s.id}}
  end
  
  def delete
    p "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    # p params[:song]
    p Song.find(params[:song_id]).title
    Song.find(params[:song_id]).destroy    
  end
  
end
