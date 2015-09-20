$(document).ready(function() {

  $("#start_button p").on("click", function(){
    $("#start_button").hide();
    $(".select_ship_wrapper").show();
    $("#the_submit_button").show();
  });

  $(".a_ship").hover(
    function(){
      $(this).find("p").show();
      $(this).find("li").show();
      $(this).find("br").show();
    },
    function(){
      $(".a_ship p,li,br").hide();
    }
  );

  $(".a_ship").on("click", function(){
    $(this).closest(".select_ship_wrapper").find(".chosen_ship_holder").val($(this).find("input").val());
    if($(this).closest(".select_ship").find(".a_ship").css("background-color","#fff"));
    $(this).css("background-color", "#ddd");
  });
});