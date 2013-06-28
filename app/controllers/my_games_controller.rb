class MyGamesController < ApplicationController

  before_action :authenticate_user!

  def index
    @games = current_user.games.decorate
  end

	def create
		@game = Game.new(game_params).decorate
		respond_to do |format|
			format.js do
				if @game.save
					render partial: 'games'
				else
					render partial: 'shared/alerts'
				end
			end
		end
	end

	private

	def game_params
		params.require(:game).permit(:title, :bgg_id)
	end

end
