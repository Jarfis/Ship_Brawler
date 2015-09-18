# Homepage (Root path)

get '/' do
  erb :index
end

get "/board" do
  @ship1 = Ship.find_by(ship_name_value: "first_ship")
  @ship2 = Ship.find_by(ship_name_value: "second_ship")
  erb :"board/index"
end

get "/start_menu" do
  erb :"menu/start_menu"
end