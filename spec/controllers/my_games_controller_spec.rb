require 'spec_helper'

describe MyGamesController do

  describe "#index" do

    before(:each) do
      FactoryGirl.create(:game)
      user_game = FactoryGirl.create(:user_game)
      @user = user_game.user
      @game = user_game.game
			sign_in @user
    end

    it "should set @games to the list of the current user's games" do
      get :index
      expect(assigns(:games)).to include(@game)
      expect(assigns(:games).length).to eq 1
    end

  end

	describe "#create" do

		before(:each) do
			@user = FactoryGirl.create(:user)
			sign_in @user
		end

		it "should call add_game_by_title on the current_user with the specified title" do
			game_title = 'Game ' + rand(100).to_s
			@user.should_receive(:add_game_by_title).with(game_title)
			post :create, { format: 'js', game: { title: game_title } }
		end

	end

end
