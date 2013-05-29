class MyGamesController < ApplicationController

  before_action :authenticate_user!

  def index
  end

end
