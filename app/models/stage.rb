class Stage < ActiveRecord::Base
  attr_accessible :game_id, :section_0, :section_1, :section_2, :section_3, :section_4, :section_5
  
  belongs_to :game
  has_one :user, :through => :game
end
