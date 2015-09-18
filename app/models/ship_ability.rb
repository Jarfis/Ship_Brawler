class ShipAbility < ActiveRecord::Base
  belongs_to :ship
  belongs_to :ability
end