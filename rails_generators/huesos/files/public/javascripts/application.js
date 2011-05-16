$(function() {
  $("input, textarea, select, button").uniform();
  if (RAILS_ENV == "development") {
    $('body').dblclick(function() { $(this).addClass("grid"); }); 
  }
});
