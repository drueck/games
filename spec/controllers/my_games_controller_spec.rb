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
			@game_title = 'Game ' + rand(100).to_s
			sign_in @user
		end

		it "should call add_game_by_title on the current_user with the specified title" do
			@user.should_receive(:add_game_by_title).with(@game_title)
			post :create, { format: 'js', game: { title: @game_title } }
		end

		it "should assign the user's current list of games to @games" do
			post :create, { format: 'js', game: { title: @game_title } }
			expect(assigns(:games)).to eq @user.games
		end

		it "should render the games javascript partial" do
			post :create, { format: 'js', game: { title: @game_title } }
			expect(response).to render_template(partial: '_games')
		end

	end

	describe "#destroy" do

		before(:each) do
			@user = FactoryGirl.create(:user)
			@game = Game.create(title: 'Game')
			sign_in @user
		end

		it "should call remove_game on the current_user with the game specified" do
			@user.should_receive(:remove_game).with(@game)
			post :destroy, { format: 'js', id: @game.id }
		end

		it "should assign the user's current list of games to @games" do
			post :destroy, { format: 'js', id: @game.id }
			expect(assigns(:games)).to eq @user.games
		end

		it "should render the games javascript partial" do
			post :destroy, { format: 'js', id: @game.id }
			expect(response).to render_template(partial: '_games')
		end

	end

end
