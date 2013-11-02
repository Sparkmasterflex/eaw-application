class CreateEmpires < ActiveRecord::Migration
  def change
    create_table :empires do |t|
      t.integer :game_id
      t.integer :user_id
      t.integer :empire
      t.integer :treasury
      t.integer :armies_count, :default => 0
      t.integer :cities_count, :default => 0
      t.integer :agents_count, :default => 0
      t.string  :war_with
      t.string  :peace_with

      t.timestamps
    end
  end
end
