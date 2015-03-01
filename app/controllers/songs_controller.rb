class SongsController < ApplicationController

  def show
    @songs = Song.all
    render 'users/index'
  end

  def submit
    @song = Song.create(song_params)
     show
  end
  private

  def song_params
    params.require(:song).permit(:user_id, :name, :artist)
  end

end
