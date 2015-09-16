class Board
  def get_ship_stats(ship)
  end

  #maybe later
  # def print_ship_card(ship)
  # end

  def get_health_bar_class#(ship)
    #ship.get_health.do_the_conversion_here
    "percent_75"
  end

  def get_attack_power_class
  end

  def get_all_combat_log
    #CombatLog.get_all
    temp = []
    20.times do
      temp << get_combat_line
    end
    temp
  end

  def get_combat_line
    "player 1 did X damage"
  end
end