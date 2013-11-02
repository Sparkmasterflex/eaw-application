class Empire < ActiveRecord::Base
  attr_accessible :game_id, :user_id, :clan, :turn, :treasury, 
                  :armies_count, :cities_count, :agents_count, :peace_with, :war_with
                  
  class Empires
    EGYPT    = 10
    ROME     = 20
    GREECE   = 30
    GAUL     = 40
    CARTHAGE = 50
    JAPAN    = 60
    MONGOLS  = 70
    UNDEAD   = 80
    
    LABELS = {
      ROME => "Romans", GAUL => "The Gaul"
      # EGYPT => "Egyptians", GREECE => "Greeks", 
      # CARTHAGE => "Carthaginians", JAPAN => "Japanese", MONGOLS => "Mongols", UNDEAD => "The Undead"
    }

    KLASSES = {
      EGYPT => "egypt", ROME => "rome", GREECE => "greece", GAUL => "gaul", 
      CARTHAGE => "carthage", JAPAN => "japan", MONGOLS => "mongol", UNDEAD => "undead"
    }
    
    def self.options_for_select
      LABELS.sort.collect { |arr| arr.reverse }.unshift(["Please Select", nil])
    end
  end
  
  belongs_to :game
  belongs_to :user
  has_one :stage, :through => :game
  has_many :pieces
  
  def empire_name
    Empires::LABELS[clan]
  end

  def empire_klass
    Empires::KLASSES[clan]
  end

  def self.website_empire_info
    # TODO: load yaml file, for each empire will have:
    # => 1. Name
    # => 2. description
    # => 3. list of images w/alt and title tags
    
  end
end
