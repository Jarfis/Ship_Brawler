# Homepage (Root path)
@board = Board.new
@game = Game.new
get '/' do
  erb :index
end

get "/board" do
  @combat_log=@board.get_all_combat_log
  erb :"board/index"
end

post "/use_ability" do
  @game.use_ability(params[:name])
  erb :"/board/index"
end