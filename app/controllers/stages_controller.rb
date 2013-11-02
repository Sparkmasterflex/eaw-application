class StagesController < ApplicationController
  before_filter :authenticate_user!, :find_game
  before_filter :find_stage, :except => [:new, :create]
  
  respond_to :html, :js, :json
    
  def show
    respond_with @stage.to_json
  end
  
  def new
    @game.build_stage
  end
  
  def create
    @stage = @game.build_stage(params[:stage])
    
    respond_with @stage.save
  end
  
  def update
    Rails.logger.info "==== update: #{@stage.inspect} ===="
    respond_with @stage.update_attributes(params[:stage])
  end
  
  private
  
  def find_stage
    @stage = Stage.find(params[:id])
  end
end
