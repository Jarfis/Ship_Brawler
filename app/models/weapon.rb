class Weapon < ActiveRecord::Base
  has_and_belongs_to_many :ships, join_table: "ship_weapons"
end