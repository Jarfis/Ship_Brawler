class Game < ActiveRecord::Base
  has_many :ships
  #belongs_to :ship, foreign_key: "winning_ship"

  def get_player_ship(id)
    self.ships.find(id)
  end

end