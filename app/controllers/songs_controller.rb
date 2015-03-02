class SongsController < ApplicationController

  # def create
    # @user = User.create(params[:user])
  # end

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.

  def user_params
    params.require(:user).permit(:song)
  end
  
  def upload
    @user = current_user
    @song = Song.new
  end
  
  def player
    @user = "HEELLLLO"
  end
  
  
end
