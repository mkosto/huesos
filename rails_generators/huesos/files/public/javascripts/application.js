;$(function() {
  $("a.photo").colorbox({rel: "photo", current: "Foto {current} de {total}"});
  $(".chzn-select").chosen();
  $(".chzn-select-deselect").chosen({allow_single_deselect: true});
  
  if (RAILS_ENV == "development") {
    $('body').dblclick(function() { 
      if ($('#grid_overlay').length) {
        $('#grid_overlay').remove()
      } else {
        $('<div id="grid_overlay" />').height($(document).height()).prependTo('body');
      }
    });
  }
  
  /* Slidesjs */
  $(".slides").slides({
		preload: true,
		preloadImage: '/images/huesos/slides-loading.gif',
		play: 2500, /* Autoplay slideshow */
		pause: 2500, /* Pause slideshow on click of next/prev or pagination. */
		generateNextPrev: false,
		generatePagination: true,
		effect: 'slide, fade',
		hoverPause: true,
		crossfade: true
	});
	
	$(".slides").hover(function(){
	    $("a.prev, a.next", this).stop().animate({"opacity": 0.80}, 250);
	},function(){
	    $("a.prev, a.next", this).stop().animate({"opacity": 0}, 250);
	});
	
});
