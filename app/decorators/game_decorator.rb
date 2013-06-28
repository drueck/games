class GameDecorator < Draper::Decorator

  delegate_all

	def bgg_url
		"http://boardgamegeek.com/boardgame/#{bgg_id}/"
	end

end
