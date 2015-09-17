$(document).ready(function() {
  var ships = {};
  ships["player_one"]=ship_one_in;
  ships["player_two"]=ship_two_in;

  ships["player_one"]["abilities"]=ship_one_abilities_in;
  ships["player_two"]["abilities"]=ship_two_abilities_in;

  $(".attack_button").bind("click", function(){
    attack(ships["player_one"],$(this).attr("value"),ships["player_two"]);
    update_health_fill();
  });

  function attack(attacker, ability_id, attackee){
    attackee.current_health -= attacker.abilities[ability_id].damage;
  }

  function update_health_fill(){
    $(".player_one .health_fill").css("width", ships.player_one.current_health+"%");
    $(".player_two .health_fill").css("width", ships.player_two.current_health+"%");
  }
});
