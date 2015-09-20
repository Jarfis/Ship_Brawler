# Homepage (Root path)

get '/' do
  erb :index
end

post "/board" do
  @ship1 = Ship.find_by(ship_name_value: params[:player_two_chosen_ship])
  @ship2 = Ship.find_by(ship_name_value: params[:player_one_chosen_ship])
  erb :"board/index"
end

get "/start_menu" do
  erb :"menu/start_menu"
end