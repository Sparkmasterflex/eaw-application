class GamesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_game, :except => [:new, :create]
  
  respond_to :html, :js, :json
  
  def index
    respond_with @game
  end
  
  def show
    respond_with @game
  end
  
  def new
    @game = Game.new
    @game.empires.build
  end
  
  def create
    selected = params[:game][:empires_attributes]["0"][:clan]
    @game = Game.new(params[:game].merge(user_id: current_user.id, selected: selected, turn: 1))
    
    if @game.save
      Stage.create(:game_id => @game.id)
      redirect_to root_url
    else
      render :action => :new
    end
  end
  
  def update
    params[:game].merge!(empire_id: nil)
    respond_with @game.update_attributes(params[:game])
  end
end
