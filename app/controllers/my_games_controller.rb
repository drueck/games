class MyGamesController < ApplicationController

  before_action :authenticate_user!

  def index
    @games = current_user.games
  end

	def create
		user = current_user
		user.add_game(params[:game][:title])
		@games = user.games
		respond_to do |format|
			format.js { render partial: 'games' }
		end
	end

end
