class AddAbilityTableColumnsAndWeaponTableAndACoupleShipColumns < ActiveRecord::Migration
  def change
    change_table :abilities do |t|
      t.boolean :self_target
      t.integer :turn_length
      t.integer :energy_cost
    end

    create_table :weapons do |t|
      t.string :name_value
      t.string :name_print
      t.integer :damage
      t.integer :ammo
    end

    change_table :ships do |t|
      t.integer :max_energy
      t.integer :energy_recharge
      t.integer :current_energy
    end
  end
end
