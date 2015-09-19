class AddingImageColumnToShip < ActiveRecord::Migration
  def change
    change_table :ships do |t|
      t.string :ship_image
    end
  end
end
