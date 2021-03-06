class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :user_games, dependent: :destroy
  has_many :games, -> { order 'title' }, through: :user_games

	def add_game(game)
		games << game unless games.include?(game)
	end

	def add_game_by_title(title)
		existing_game = Game.where('title ilike ?', title).limit(1).try(:first)
		game = existing_game || Game.create(title: format_title(title))
		add_game(game)
	end

	def remove_game(game)
		if games.include?(game)
			games.destroy(game)
			game.destroy if game.users.empty?
		end
	end

	private

	def format_title(title)
		title.downcase.titleize
	end

end
