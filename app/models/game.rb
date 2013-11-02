class Game < ActiveRecord::Base
  attr_accessible :user_id, :empire_id, :stage_id, :difficulty, :status, :empires_attributes, :selected, :turn
  attr_accessor :empire_id, :stage_id, :selected

  before_create :build_empires
  
  class Difficulty
    EASY   =  10
    MEDIUM =  50
    HARD   = 100
    
    LABELS = { EASY => "Easy", MEDIUM => "Medium", HARD => "Hard"}
    MONEY = { EASY => 2500, MEDIUM => 1250, HARD => 750}
    
    def self.options_for_select
      LABELS.sort.collect { |arr| arr.reverse }.unshift(["Please Select", nil])
    end
  end
  
  class Status
    NEW     =  10
    ACTIVE  =  50
    VICTORY = 100
  end
  
  belongs_to :user
  has_many :empires
  has_one :stage
  
  accepts_nested_attributes_for :empires
  
  def user_empire
    @user_empire ||= Empire.where(:game_id => id, :user_id => user_id).limit(1).first
  end
  
  def empire_name
    @empire_name ||= user_empire.empire_name
  end
  
  def as_json options={}
    json = {}
    attributes.each do |key, value|
      json.merge!({key => value}) unless [:created_at, :updated_at].include?(key)
      json.merge!({key => value.strftime("%m/%d/%Y")}) if [:created_at, :updated_at].include?(key)
    end
    
    json.merge!(:empire_id => user_empire.id) unless user_empire.nil? 
    json.merge!(:stage_id => stage.id) unless stage.nil?
    
    json 
  end

  private

  def build_empires
    empires.first.update_attributes(treasury: Difficulty::MONEY[difficulty])
    Empire::Empires::LABELS.each do |key, val|
      empires.build(clan: key, treasury: Difficulty::MONEY[difficulty]) unless key == selected.to_i
    end
  end
end
