class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def find_game
    @game = params[:controller] == 'games' && params[:id] ? Game.find(params[:id]) : current_user.game
  end

  def after_sign_in_path_for(resource)
    root_path
  end
end
