require 'spec_helper'

describe MyGamesController do

  include Devise::TestHelpers

  describe "GET index" do

    before(:each) do
      user_game = FactoryGirl.create(:user_game)
      @user = user_game.user
      @game = user_game.game
      FactoryGirl.create(:game)
      request.env['warden'].stub :authenticate! => @user
      controller.stub :current_user => @user
    end

    it "should set @games to the list of the current user's games" do
      get :index
      expect(assigns(:games)).to include(@game)
      expect(assigns(:games).length).to eq 1
    end

  end

end
