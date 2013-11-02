class PiecesController < ApplicationController
  before_filter :authenticate_user!, :find_game
  before_filter :find_piece, :except => [:index, :new, :create]
  skip_before_filter :find_game
  
  respond_to :html, :js, :json
  
  def index
    respond_with @pieces = Empire.find(params[:empire_id]).pieces 
  end
  
  def show
    respond_with @piece
  end
  
  def new
    Empire.find(params[:empire_id]).pieces.build
  end
  
  def create
    empire = Empire.find(params[:empire_id])
    respond_with @piece = Piece.create(params[:piece].merge(:empire_id => params[:empire_id]))
  end
  
  def update
    respond_with @piece.update_attributes(params[:piece])
  end

  def destroy
    respond_with @piece.destroy()
  end
  
  private
  
  def find_piece
    @piece = Piece.find(params[:id])
  end
end
