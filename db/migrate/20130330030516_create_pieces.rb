class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      
      # generic
      t.integer :pieceType
      t.string  :name
      t.string  :square
      t.integer :empire_id
      t.integer :built_id
      
      # city specific
      t.text    :buildings
      t.integer :population
      t.text    :building_queue
      t.text    :units_queue
      
      # army specific
      t.text    :general

      # agent specific
      
      # specific to multiple
      t.integer :moves
      t.text    :units
      t.text    :agents
      
      

      t.timestamps
    end
  end
end
