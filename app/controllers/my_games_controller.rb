class MyGamesController < ApplicationController

  before_action :authenticate_user!

  def index
    @games = current_user.games
  end

	def create
		user = current_user
		user.add_game_by_title(params[:game][:title]) if params[:game][:title].present?
		@games = user.games
		respond_to do |format|
			format.js { render partial: 'games' }
		end
	end

	def destroy
		user = current_user
		game = Game.find(params[:id])
		user.remove_game(game)
		@games = user.games
		respond_to do |format|
			format.js { render partial: 'games' }
		end
	end

end
