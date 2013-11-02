class WebsiteController < ApplicationController
  
  def index
    @user = User.new
  end

  def view_empires
    @empires = LoadYaml::EMPIRE_INFO['empires']
  end
end
