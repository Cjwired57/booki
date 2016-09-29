
$(window).on('resize', function(){
  var win = $(this);
  if (win.width() > 700) {
    console.log("width changed")
    $('.gamepics').addClass('col-md-4');
  }
  else
  {
    $('.gamepics').removeClass('col-md-4');
    $('.gamepics').css( "display", "block" );
    $('.gamepics').css( "float", "left" );
  }
});

