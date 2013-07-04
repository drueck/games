class HomeController < ApplicationController

  def index
		redirect_to my_games_path if current_user
  end

end
