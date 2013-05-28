class BoardGameGeekSearchController < ApplicationController

  before_action :authenticate_user!

  def index
    @games = []
    unless params[:query].blank?
      @games = BoardGameGeek.search(params[:query])
    end
    respond_to do |format|
      format.json { render json: @games }
    end
  end

end
