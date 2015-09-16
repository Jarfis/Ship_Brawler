class Game

  @players={
    player_one: {
      player_ship: nil
    },
    player_two: {
      player_ship: nil
    }
  }

  @current_player = :player_one

  def get_current_player_ship
    @players[@current_player]
  end

  def toggle_turn
    @current_player == :player_one ? @current_player = :player_two : @current_player = :player_one
  end

  def is_ship_dead?(ship)
    ship.is_dead?
  end

  def attack
    #@current_player.fire(@other_player)
  end

  def use_weapon(weapon)
    #@current_player.attack_with(weapon, @other_player)
  end

  def use_ability(ability)
    #@current_player.ability(@target)
  end

  def get_player_ship(id)
    @players[id]
  end
end