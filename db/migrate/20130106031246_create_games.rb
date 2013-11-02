class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :user_id
      t.integer :difficulty
      t.integer :status, :default => Game::Status::NEW
      t.integer :turn, :default => 1

      t.timestamps
    end
  end
end
