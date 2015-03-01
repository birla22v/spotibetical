class SongsController < ApplicationController

  def show
    @songs = Song.all
    render 'users/index'
  end

  def submit
    isthere = 0
    count = Song.count
    count.times do |i|
      s=Song.find(i+1)
      if s.artist == song_params[:artist] && s.name == song_params[:name]
        flash[:alert] = "Song is already in the playlist!"
        isthere = 1
        break
      end
    end
    if isthere!=1
      @song = Song.create(song_params)    
    end
    show
  end

  private
  def song_params
    params.require(:song).permit(:user_id, :name, :artist)
  end

end
