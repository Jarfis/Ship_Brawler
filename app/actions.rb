# Homepage (Root path)
get '/' do
  erb :index
end

get "/board" do
  @player_one=nil
  @player_two=nil
  @board = Board.new
  @combat_log=@board.get_all_combat_log
  erb :"board/index"
end
