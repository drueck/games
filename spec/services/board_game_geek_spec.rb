require 'spec_helper'

describe BoardGameGeek do

  describe "#search(query)" do
    context "when given a query that matches a game" do
      it "the resulting array should include a record for that game" do
        BggApi.stub(:search_by_name).and_return([{ id: 31260, name: 'Agricola' }])
        games = BoardGameGeek.search('Agricola')
        expect(games).not_to be_empty
        expect(games[0]).to have_key(:bgg_id)
        expect(games.map { |g| g[:title] }).to include('Agricola')
      end
    end
  end

end
