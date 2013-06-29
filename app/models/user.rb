class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :user_games, dependent: :destroy
  has_many :games, through: :user_games

	def add_game(game)
		if game.kind_of? Game
			games << game
		else
			existing_game = Game.where('title ilike ?', game).limit(1).try(:first)
			g = existing_game || Game.create(title: game)
			games << g
		end
	end

end
