require 'spec_helper'

describe BoardGameGeekSearchController do

  include Devise::TestHelpers

  describe "GET index" do

    before(:each) do
      @user = FactoryGirl.create(:user)
      request.env['warden'].stub :authenticate! => @user
      controller.stub :current_user => @user
      BoardGameGeek.stub(:search).and_return([{ title: 'Agricola', bgg_id: 1 }])
    end

    context "when query param is specified" do
      it "assigns @games to an array of matching results" do
        get :index, format: :json, query: 'Agricola'
        expect(assigns(:games)).not_to be_empty
        expect(assigns(:games).map { |g| g[:title] }).to include('Agricola')
      end
    end

    context "when no query param is specified" do
      it "assigns @games to an empty array" do
        get :index, format: :json
        expect(assigns(:games)).to be_empty
      end
    end

  end

end
