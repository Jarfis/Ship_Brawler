$(document).ready(function() {
  var ships = {};
  ships["player_one"]=ship_one_in;
  ships["player_two"]=ship_two_in;

  ships["player_one"]["abilities"]=ship_one_abilities_in;
  ships["player_two"]["abilities"]=ship_two_abilities_in;

  ships["player_one"]["weapons"]=ship_one_weapons_in;
  ships["player_two"]["weapons"]=ship_two_weapons_in;

  var current_player = [ships.player_one, "player_one"];
  var other_player = [ships.player_two, "player_two"];

  toggle_buttons();
  bind_weapons_and_abilities();
  update_health_energy_fill();
  initialize_ammo();

  draw_ship("player_one");
  draw_ship("player_two");
  //$("#winner_modal").hide();

  $(".ability_table td").hover(
    function(){
      var theability;

      if ($(this).closest("tr").attr("class") == "weapons")
      {
        theability = ships[$(this).closest(".player_container").attr("class").split(" ")[1]].weapons[$(this).find("input").attr("value")]
        display_weapon_info($(this).closest(".player_container").attr("class").split(" ")[1], theability);
      }
      else
      {
        theability = ships[$(this).closest(".player_container").attr("class").split(" ")[1]].abilities[$(this).find("input").attr("value")]
        display_ability_info($(this).closest(".player_container").attr("class").split(" ")[1], theability);

        display_ability_energy_cost($(this).closest(".player_container").attr("class").split(" ")[1], theability);
      }
    },
    function(){
      clear_ability_info($(this).closest(".player_container").attr("class").split(" ")[1]);
      clear_weapon_info($(this).closest(".player_container").attr("class").split(" ")[1]);
      clear_energy_cost($(this).closest(".player_container").attr("class").split(" ")[1]);
    }
  );

  function get_element_player(the_element){
    return the_element.closest(".player_container").attr("class").split(" ")[1];
  }

  function initialize_ammo(){
    $("tr.weapons input").each(function(index){
      for (i=0;i<ships[get_element_player($(this))].weapons[$(this).attr("value")].ammo;i++)
      {
        $(this).parent().find(".ammo_container").prepend("<img src=\"ammo.png\" class=\"ammo_icon\"/>");
      }
    });
  }

  function display_ability_energy_cost(the_player_container, ability){
    $("."+the_player_container + " .energy_over_fill").css("width", (ships[the_player_container].current_energy-ability.energy_cost) + "%");
    
    //$(the_player_container + " .energy_over_fill").css("width", (ships.player_one.current_energy-10)+"%");
  }

  function clear_energy_cost(the_player_container)
  {
    $("."+the_player_container + " .energy_over_fill").css("width", (ships[the_player_container].current_energy/ships[the_player_container].max_energy)*100 + "%");
  }

  function display_ability_info(the_player_container, ability){
    $(".player_container."+ the_player_container).find(".ability_name").text(ability.name_print);
    if (ability.damage < 0)
    {
      $(".player_container."+ the_player_container).find(".ability_damage").text(ability.damage.toString().substring(1));
      $(".player_container."+ the_player_container).find(".ability_damage").css("color", "green");
    }
    else
    {
      $(".player_container."+ the_player_container).find(".ability_damage").css("color", "red");
    }

    $(".player_container."+ the_player_container).find(".ability_name").show()
    $(".player_container."+ the_player_container).find(".ability_damage").show();
  }

  function clear_ability_info(the_player_container){
    $(".player_container."+ the_player_container).find(".ability_name").text("");
    $(".player_container."+ the_player_container).find(".ability_damage").text("");

    $(".player_container."+ the_player_container).find(".ability_name").hide()
    $(".player_container."+ the_player_container).find(".ability_damage").hide();
  }

  function display_weapon_info(the_player_container, weapon){
    $(".player_container."+ the_player_container).find(".weapon_name").text(weapon.name_print);
    $(".player_container."+ the_player_container).find(".weapon_damage").text(weapon.damage);
    $(".player_container."+ the_player_container).find(".weapon_damage").css("color","red");

    $(".player_container."+ the_player_container).find(".weapon_name").show()
    $(".player_container."+ the_player_container).find(".weapon_damage").show();
  }

  function clear_weapon_info(the_player_container){
    $(".player_container."+ the_player_container).find(".weapon_name").text("");
    $(".player_container."+ the_player_container).find(".weapon_damage").text("");

    $(".player_container."+ the_player_container).find(".weapon_name").hide()
    $(".player_container."+ the_player_container).find(".weapon_damage").hide();
  }

  function bind_weapons_and_abilities(){
    $(".ability_table td").off("click");
    $(".ability_table:not(.not_turn) .weapons td:not(.no_ammo)").on("click", function(){
      //ships[$(this).closest(".player_container").attr("class").split(" "[1])]
      var theweapon = current_player[0].weapons[$(this).find("input").attr("value")];
      use_weapon(current_player[0],theweapon,other_player[0]);
      update_health_energy_fill();
    });
    $(".ability_table:not(.not_turn) .abilities td:not(.no_energy)").on("click", function(){
      //ships[$(this).closest(".player_container").attr("class").split(" "[1])]
      var attackee;
      var theability = current_player[0].abilities[$(this).find("input").attr("value")];
      if(theability.damage<0)
      {
        attackee = current_player[0];
      }
      use_ability(current_player[0],theability,attackee);
      update_health_energy_fill();
    });
  }

  function use_weapon(attacker, weapon, attackee){
    attackee.current_health -= weapon.damage;

    if(weapon.max_ammo != 0)
    {
      weapon.ammo -= 1;
      update_ammo(weapon);
    }

    if (is_target_dead(attackee))
    {
      end_game();
    }
    else
    {
      toggle_turns();
    }
  }

  function update_ammo(weapon){
    $("."+current_player[1]+" :input[value='"+weapon.name_value+"']").parent().find(".ammo_container").empty();
    for (i=0;i<weapon.ammo;i++)
    {
      $("."+current_player[1]+" :input[value='"+weapon.name_value+"']").parent().find(".ammo_container").prepend("<img src=\"ammo.png\" class=\"ammo_icon\"/>");
    }

    if(weapon.ammo <=0)
    {
      $("."+current_player[1]+" :input[value='"+weapon.name_value+"']").parent().addClass("no_ammo");
    }
  }

  function use_ability(attacker, ability, attackee)
  {
    attackee.current_health -= ability.damage;
    attacker.current_energy -= ability.energy_cost;
    if (is_target_dead(attackee))
    {
      end_game();
    }
    else
    {
      toggle_turns();
    }
  }

  function update_abilities_low_energy(){
    $("."+current_player[1]+" tr.abilities input").each(function(index){
      if(current_player[0].abilities[$(this).val()].energy_cost > current_player[0].current_energy)
      {
        if(!($(this).parent().hasClass("no_energy")))
        {
          $(this).parent().addClass("no_energy");
        }
      }
      else
      {
        if($(this).parent().hasClass("no_energy"))
        {
          $(this).parent().removeClass("no_energy");
        }
      }
    });
  }

  function update_health_energy_fill(){
    $(".player_one .health_fill").css("width", (ships.player_one.current_health/ships.player_one.max_health)*100+"%");
    $(".player_two .health_fill").css("width", (ships.player_two.current_health/ships.player_two.max_health)*100+"%");

    $(".player_one .energy_over_fill").css("width", (ships.player_one.current_energy/ships.player_one.max_energy)*100+"%");
    $(".player_two .energy_over_fill").css("width", (ships.player_two.current_energy/ships.player_two.max_energy)*100+"%");

    $(".player_one .energy_under_fill").css("width", (ships.player_one.current_energy/ships.player_one.max_energy)*100+"%");
    $(".player_two .energy_under_fill").css("width", (ships.player_two.current_energy/ships.player_two.max_energy)*100+"%");
  }

  function is_target_dead(target){
    return target.current_health <= 0;
  }

  function toggle_turns(){
    if((current_player[0].current_energy + current_player[0].energy_recharge) >= current_player[0].max_energy){
      current_player[0].current_energy = current_player[0].max_energy;
    }
    else
    {
      current_player[0].current_energy += current_player[0].energy_recharge;
    }

    if (current_player[0].id == ships.player_one.id)
    {
      current_player = [ships.player_two, "player_two"];
      other_player = [ships.player_one, "player_one"];
    }
    else
    {
      current_player = [ships.player_one, "player_one"];
      other_player = [ships.player_two, "player_two"];
    }
    update_abilities_low_energy();

    update_health_energy_fill();
    toggle_buttons();
    bind_weapons_and_abilities();
  }

  function toggle_buttons(){
    $(".player_container."+ current_player[1]).find(".ability_table").removeClass("not_turn");
    $(".player_container."+other_player[1]).find(".ability_table").addClass("not_turn");
  }

  function end_game(){
    $("#winner_modal").show();
    $("#winner_name").text(current_player[0].ship_name);
  }

 function draw_ship(the_player){
   $("."+the_player + " .ship_wrapper").prepend("<img class='ship_image' src="+ships[the_player].ship_image+"></img>");
  }
});
