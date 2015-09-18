class Ship < ActiveRecord::Base
  #has_many :ship_weapons
  #has_many :ship_abilitys
  has_and_belongs_to_many :weapons, join_table: "ship_weapons"
  has_and_belongs_to_many :abilities, join_table: "ship_abilities"

  def placeholder_abilities
    {
      attack_1: {name: "attack 1",damage: 5}, 
      attack_2: {name: "mega attack",damage: 60}, 
      attack_3: {name: "micro attack",damage: 1}, 
      attack_4: {name: "medium attack",damage: 15}, 
      attack_5: {name: "nothing attack",damage: 0}
    }
  end

  def get_abilities_friendly
    temp = {}

    self.abilities.each do |a|
      temp[a.name_value] = a
    end

    temp
  end

  def get_weapons_friendly
    temp = {}

    self.weapons.each do |a|
      temp[a.name_value] = a
    end

    temp
  end
end