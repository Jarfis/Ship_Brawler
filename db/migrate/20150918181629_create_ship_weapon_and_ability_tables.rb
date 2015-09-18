class CreateShipWeaponAndAbilityTables < ActiveRecord::Migration
  def change
    create_table :ship_abilities do |t|
      t.references :ship
      t.references :ability
    end

    create_table :ship_weapons do |t|
      t.references :ship
      t.references :weapon
    end
  end
end
