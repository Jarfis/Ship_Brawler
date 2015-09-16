class Board
  def get_current_player_stats
  end

  #maybe later
  # def print_ship_card(ship)
  # end

  def get_health_bar_class(player)
    #game.get_player_ship(player).get_health + some jiggering here ==
    "percent_75"
  end

  def get_attack_power_class(player)
    #game.get_player_ship(player).get_attack_power
  end

  def get_all_combat_log
    #CombatLog.get_all
    temp = []
    20.times do
      #temp << @game.get_combat_line
      temp << "player 1 did X damage"
    end
    temp
  end

  def get_ship_abilities(player)
    #@game.get_player_ship(player).get_abilities
    ability_one={
      name: "attack",
      damage: 5
    }
    ability_two={
      name: "attack1",
      damage: 5
    }
    ability_three={
      name: "attack2",
      damage: 5
    }
    ability_four={
      name: "attack3",
      damage: 5
    }
    ability_five={
      name: "attack4",
      damage: 5
    }
    [ability_one, ability_two, ability_three, ability_four, ability_five]
  end
end