class AddSomeShipColumns < ActiveRecord::Migration
  def change
    change_table :ships do |t|
      t.string :ship_name
    end
  end
end
