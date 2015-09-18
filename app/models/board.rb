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

  def self.get_ship_abilities(player_id)
    get_game.get_player_ship(player_id).placeholder_abilities
  end
end