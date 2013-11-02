class ChangeEmpireColumn < ActiveRecord::Migration
  def up
  	rename_column :empires, :empire, :clan
  end

  def down
  	rename_column :empires, :clan, :empire
  end
end
