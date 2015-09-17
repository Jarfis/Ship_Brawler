class Game < ActiveRecord::Base
  has_many :ships
  #belongs_to :ship, foreign_key: "winning_ship"

  def get_current_player_ship
    self.ships.find(self.current_player)
  end

  def get_other_player_ship
    self.ships.where.not(id: self.current_player)[0]
  end

  def toggle_turn
    self.current_player == self.ships[0].id ? self.current_player = self.ships[1].id : self.current_player = self.ships[0].id
    self.save
  end

  def is_ship_dead?(ship)
    ship.is_dead?
  end

  def attack(target_id)
    get_current_player_ship.fire(self.ships.find(target_id))
  end

  def use_weapon(weapon_id, target_id)
    
  end

  def use_ability(ability_id, target)
    target.damage(get_current_player_ship.get_ability(ability_id.to_sym)[:damage])
    if target.is_dead?
      self.game_over = true
      self.save
    elsif action_points_gone
      toggle_turn
    end
  end

  def get_player_ship(id)
    self.ships.find(id)
  end

  def is_turn?(the_id)
    get_current_player_ship.id == the_id
  end

  def action_points_gone
    true
  end

  def end_game
    self.winning_ship = get_current_player_ship.id
    self.save
  end

  def get_game_over
    self.game_over
  end

  def test_method

  end
end