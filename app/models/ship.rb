class Ship < ActiveRecord::Base
  belongs_to :game

  def is_dead?
    self.current_health <= 0
  end

  def get_health_percent
    ((self.current_health/self.max_health.to_f).round(2)) *100
  end

  def damage(dam)
    self.current_health -= dam
    self.save
  end

  def abilities
    {
      attack_1: {name: "attack 1",damage: 5}, 
      attack_2: {name: "mega attack",damage: 60}
    }
  end

  def get_ability(ability_id)
    abilities[ability_id]
  end
end