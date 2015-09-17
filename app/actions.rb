# Homepage (Root path)

get '/' do
  erb :index
end

get "/test" do
  Board.start_game
  erb :"test/index"
end

get "/board" do
  Board.start_game
  @combat_log=Board.get_all_combat_log
  erb :"board/index"
end

post "/use_ability" do
  Board.get_game.use_ability(params[:attack], Board.get_game.get_other_player_ship)
  @temp1 = Board.get_game.get_game_over
  if Board.get_game.game_over == true
    Board.get_game.end_game
    erb :"menu/victory"
  else
    erb :"board/index"
  end
end

get "/start_menu" do
  erb :"menu/start_menu"
end