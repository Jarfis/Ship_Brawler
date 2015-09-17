class CreatingInitialTables < ActiveRecord::Migration
  def change

    create_table :games do |t|
      t.integer :current_player
    end

    create_table :ships do |t|
      t.integer :max_health
      t.integer :current_health
      t.references :game
    end

    create_table :abilities do |t|
      t.string :name
      t.integer :damage
    end
  end
end
