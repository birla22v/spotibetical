class SongsController < ApplicationController

  def show
    @songs = Song.all
    render 'users/index'
  end

  def submit
    isthere = 0
    songs = Song.all
    count = songs.count
    count.times do |i|
    s = songs[i]
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

  def veto
    if current_user.veto_remaining == 1
      Song.destroy(Song.where(artist: song_params[:artist], name: song_params[:name]))
      Song.create(user_id: song_params[:user_id],artist: song_params[:artist], name: song_params[:name], veto: true)
      current_user.update_attribute(:veto_remaining, 0)
     else
      flash[:alert] = "You have no vetos remaining!"
     end
    render 'users/index'
  end

  private
  def song_params
    params.require(:song).permit(:user_id, :name, :artist)
  end

end
