class CreateStages < ActiveRecord::Migration
  def change
    create_table :stages do |t|
      t.integer :game_id
      t.text :section_0
      t.text :section_1
      t.text :section_2
      t.text :section_3
      t.text :section_4
      t.text :section_5

      t.timestamps
    end
  end
end
