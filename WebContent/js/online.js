// JavaScript Document
$(document).ready(function(){
  $(".icon0").hover(function(){
  	$("#icon0").show();
	$("#icon_h").addClass("icon0_hover");
  });
  
  $(".icon1").hover(function(){
	  $("#icon0").hide();
	  $("#icon_h").removeClass("icon0_hover");
  });
  $("#goTop").hover(function(){
	  $("#icon0").hide();
	  $("#icon_h").removeClass("icon0_hover");
  });
  
  $(".btn_close").click(function(){
	  $("#icon0").hide();
	  $("#icon_h").removeClass("icon0_hover");
  });
  	
  	$('#goTop').hide();
	$(window).bind('scroll', function(e) {
    var scrollTop = $(window).scrollTop();
    scrollTop > 100 ? $('#goTop').show() : $('#goTop').hide();  
	});
	$('#goTop').click(function() {
		$('body,html').stop().animate({
			'scrollTop': 0,
			'duration': 100,
			'easing': 'ease-in'
		})
	});

   	
});