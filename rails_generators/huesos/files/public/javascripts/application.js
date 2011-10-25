$(function() {
  if (RAILS_ENV == "development") {
    $('body').dblclick(function() { 
      ($('#grid').length) ? $('#grid').remove() : $('<div id="grid" />').height($(document).height()).prependTo('#canvas'); 
    });
  }
});
