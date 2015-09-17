class Board

  def self.start_game
    game = Game.first || Game.create
    game.game_over = false

    ships = Ship.where(game: game.id)

    unless ships.nil?# || ships.length > 0
      ships.destroy_all
    end
    ship1=Ship.create(max_health: 100, current_health: 100, game_id: game.id, ship_name: "placeholder 1")
    Ship.create(max_health: 100, current_health: 75, game_id: game.id, ship_name: "placeholder 2")

    game.current_player = ship1.id
    game.save
  end

  def self.get_current_player_stats
  end

  #maybe later
  # def print_ship_card(ship)
  # end

  def self.get_game
    Game.first
  end

  def self.get_health_bar_percent(player_id)
    get_game.get_player_ship(player_id).get_health_percent.to_s + "%"
  end

  def self.get_attack_power_class(player)
    #game.get_player_ship(player).get_attack_power
  end

  def self.get_all_combat_log
    #CombatLog.get_all
    temp = []
    20.times do
      #temp << @game.get_combat_line
      temp << "player 1 did X damage"
    end
    temp
  end

  def self.get_ship_abilities(player_id)
    get_game.get_player_ship(player_id).abilities
  end
end