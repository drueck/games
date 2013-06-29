require 'spec_helper'

describe User do

  it { should have_many(:user_games).dependent(:destroy) }
  it { should have_many(:games).through(:user_games) }

	describe "#add_game(title_or_game)" do
		context "when game is a String" do

			context "when there is no matching game already in the database" do
				before(:each) do
					@user = described_class.new
					@game = 'Game ' + rand(100).to_s
				end
				it "should create the Game, setting the title to the string passed in" do
					expect { @user.add_game(@game) }.to change{ Game.count }.from(0).to(1)
					expect(Game.first.title).to eq @game
				end
				it "should add the newly created game to the user's game collection" do
					@user.add_game(@game)
					expect(@user.games).to include(Game.first)
				end
			end

			context "when a game with the same title (differing only in case) is already in the database" do
				before(:each) do
					@user = described_class.new
					@game = Game.create(title: 'Game ' + rand(100).to_s)
				end
				it "should not create a new game" do
					expect { @user.add_game(@game.title.downcase) }.not_to change { Game.count }
				end
				it "should add the existing game with the same title to the user's collection" do
					@user.add_game(@game.title.upcase)
					expect(@user.games).to include(@game)
				end
			end

		end
		context 'when game is a Game' do
			before(:each) do
				@user = described_class.new
				@game = Game.create(title: 'Game ' + rand(100).to_s)
			end
			it "should add the game to the user's game collection" do
				expect { @user.add_game(@game) }.not_to change { Game.count }
				expect(@user.games).to include @game
			end
		end
	end

end
