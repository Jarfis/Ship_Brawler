class AddColumnToGameForVictoryState < ActiveRecord::Migration
  def change
    change_table :games do |t|
      t.boolean :game_over
    end
  end
end
