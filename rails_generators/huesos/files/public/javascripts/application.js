$(function() {
  $("input, textarea, select, button").uniform();
  if (RAILS_ENV == "development") {
    $('body').dblclick(function() { $('<div id="grid" />').height($(document).height()).prependTo('#canvas'); });
  }
});
