class Piece < ActiveRecord::Base
  attr_accessible :pieceType, :name, :square, :empire_id, :built_id, # generic 
                  :buildings, :population, :building_queue, :units_queue,  # city specific
                  :general, # army specific
                  # agent specific
                  :moves, :units, :agents # specific to multiple
                  
  class PieceType
    AGENT = 10
    ARMY  = 20
    CITY  = 30
    
    LABELS = { AGENT => 'Agent', ARMY => 'Army', CITY => 'City' }
  end
  
  belongs_to :empire
  has_one :game, :through => :empire
end
