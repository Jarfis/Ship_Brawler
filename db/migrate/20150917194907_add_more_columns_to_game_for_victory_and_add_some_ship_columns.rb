class AddMoreColumnsToGameForVictoryAndAddSomeShipColumns < ActiveRecord::Migration
  def change
    change_table :games do |t|
      t.integer :winning_ship
    end

    change_table :ships do |t|
      t.string :ship_name
    end
  end
end
