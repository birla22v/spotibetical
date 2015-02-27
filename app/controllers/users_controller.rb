class UsersController < ApplicationController
  # before_action :authenticate_user!

  def index
    # @users = User.all
    if params[:query]
      @query = RSpotify::Track.search(params[:query], limit: 10)
    end
  end

end
