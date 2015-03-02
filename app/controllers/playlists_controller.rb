class PlaylistsController < ApplicationController
  # before_action :authenticate_user!

  def show
     @playlist= Song.where(veto:nil).order(name: :asc)
    @new_playlist = []
    @new_playlist2 = []
    @new_playlist3 = []
    @playlist.each do |song|
      @new_playlist << [song.name[0],[song.votes.count,song.name,song.artist]]
    end

    while @new_playlist.length>1
      if @new_playlist[0][0]!=@new_playlist[1][0]
         @new_playlist2+=@new_playlist.shift
      elsif @new_playlist[0][1][0] > @new_playlist[1][1][0]
         @new_playlist2+=@new_playlist.shift
        @new_playlist.shift
      else
         @new_playlist.shift
      end
    end
    if @new_playlist.length == 1
      @new_playlist2+=@new_playlist
    end
    (@new_playlist2.length-1).times do |i|
      if i.odd?
        @new_playlist3+=[@new_playlist2[i]]
      end
    end


  end

end
