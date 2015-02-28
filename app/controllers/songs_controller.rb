class SongsController < ApplicationController
  def show
    @songs = Song.all
  end

  def submit(song)
    @song = Song.create(song)
    # render :show
  end
end
