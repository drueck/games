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
			sign_in
		end

		context "with valid data" do
			it "should set @game to the created game" do
				post :create, format: :js, game: FactoryGirl.attributes_for(:game)
				expect(assigns(:game).id).not_to be_nil
			end
		end

	end

end
