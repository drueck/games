require 'spec_helper'

describe GameDecorator do
	describe '#bgg_url' do
		it 'should return the board game geek url for this game' do
			game = Game.new(bgg_id: 1 + rand(100)).decorate
			expect(game.bgg_url).to eq "http://boardgamegeek.com/boardgame/#{game.bgg_id}/"
		end
	end
end
