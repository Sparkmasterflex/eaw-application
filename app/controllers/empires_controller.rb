class EmpiresController < ApplicationController
  before_filter :authenticate_user!, :find_game
  before_filter :find_empire, :except => [:index, :new, :create]
  
  respond_to :html, :js, :json
  
  def index
    respond_with @empires = Empire.where(:game_id => params[:game_id])
  end
    
  def show
    respond_with @empire
  end
  
  def update
    respond_with @empire.update_attributes(params[:empire])
  end
  
  private
  
  def find_empire
    @empire = Empire.find(params[:id])
  end
end
