class CreatingInitialTables < ActiveRecord::Migration
  def change

    create_table :ships do |t|
      t.integer :max_health
      t.integer :current_health
      t.string :ship_name_value
    end

    create_table :abilities do |t|
      t.string :name_value
      t.string :name_print
      t.integer :damage
    end
  end
end
