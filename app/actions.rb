# Homepage (Root path)

get '/' do
  erb :index
end

get "/board" do
  @ship1 = Ship.find_by(ship_name_value: "rocket")
  @ship2 = Ship.find_by(ship_name_value: "saucer")
  erb :"board/index"
end

get "/start_menu" do
  erb :"menu/start_menu"
end