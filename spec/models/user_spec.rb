require 'spec_helper'

describe User do

  it { should have_many(:user_games).dependent(:destroy) }
  it { should have_many(:games).through(:user_games) }

	describe "#add_game_by_title(title)" do

		before(:each) do
			@user = described_class.new
			@title = 'game nUmbER ' + rand(100).to_s
		end

		context "when there is no matching game already in the database" do

			it "should create the Game, setting the title to the titleized string passed in" do
				expect { @user.add_game_by_title(@title) }.to change{ Game.count }.from(0).to(1)
				expect(Game.first.title).to eq @title.downcase.titleize
			end

			it "should add the newly created game to the user's game collection" do
				@user.add_game_by_title(@title)
				expect(@user.games).to include(Game.first)
			end

		end

		context "when a game with the same title (differing only in case) is already in the database" do

			it "should not create a new game" do
				@user.add_game_by_title(@title.upcase)
				expect { @user.add_game_by_title(@title.downcase) }.not_to change { Game.count }
			end

			it "should add the existing game with the same title to the user's collection" do
				game = Game.create(title: @title.downcase)
				@user.add_game_by_title(@title.upcase)
				expect(@user.games).to include(game)
			end

		end

		context "when a game with the same title (differing only in case) is already in the user's collection" do

			it "should not add a duplicate game" do
				@user.add_game_by_title(@title.upcase)
				@user.add_game_by_title(@title.downcase)
				expect(@user.games.length).to eq 1
			end

		end

	end

	describe "#add_game(game)" do

		before(:each) do
			@user = described_class.new
			@game = Game.create(title: 'Game ' + rand(100).to_s)
		end

		context "when the game is not already in the user's collection" do

			it "should add the game to the user's game collection" do
				expect { @user.add_game(@game) }.not_to change { Game.count }
				expect(@user.games).to include @game
			end

		end

		context "when the game is already in the user's collection" do

			it "should not add a duplicate game" do
				@user.add_game(@game)
				@user.add_game(@game)
				expect(@user.games.length).to eq 1
			end

		end

	end

	describe "#remove_game" do

		before(:each) do
			@user = described_class.new
			@game = Game.create(title: 'Game ' + rand(100).to_s)
		end

		context "when the game is not in the user's collection" do

			it "should not raise an error" do
				expect { @user.remove_game(@game) }.not_to raise_error
			end

			it "should not delete the game from the database" do
				expect { @user.remove_game(@game) }.not_to change { Game.count }
			end

		end

		context "when the game is in this user's collection as well as in other user's collections" do

			it "removes the game from the user's collection" do
				other_user = described_class.new
				other_user.add_game(@game)
				@user.add_game(@game)
				@user.remove_game(@game)
				expect(@user.games).not_to include(@game)
			end

		end

		context "when the game is only in the user's collection" do

			it "removes the game from the user's collection and from the system entirely" do
				@user.add_game(@game)
				@user.remove_game(@game)
				expect(@user.games).not_to include(@game)
				expect(Game.all).not_to include(@game)
			end

		end

	end

end
