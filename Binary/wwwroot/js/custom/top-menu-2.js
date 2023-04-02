// [MASTER JAVASCRIPT]
//	Project     :	FEATHER SITE TEMPLATES
//	Version     :	1.0
//	Last Change : 	10/01/2017
//	Primary Use :   FEATHER SITE TEMPLATES

	$(document).on('ready', function() {
		"use strict"; //Start of Use Strict
		var menu_bar = $('.navbar-default');
		var menu_li = $('.navbar-default li a');
		var collapse = $('.navbar-collapse');
		var top_menu= $('#top-nav');
		
		//AFTER SCROLL MENU CREATED,MENU BGCOLOR AND TEXT COLOR
		var x = $(".header-image").offset().top;
		var topx = (x - $(window).scrollTop());
		
			if (topx < 286) { 
				menu_bar.fadeIn().addClass('fixed-header').css({
					"background-color": "#f2f2f2",
					"color": "#666666",
					"box-shadow": "0px 0px 5px rgba(0,0,0,0.3)"
					});
				menu_li.css({
					"color": "#666666"
					});				
				if(window.innerWidth<=991){
					$('.logo-image-6').css('display','inherit');
						}
						else{
						$('.logo-image-1').css('display','none');
					}
			}
			else {
				menu_bar.removeClass('fixed-header').css({
					"background-color": "#f2f2f2",
					"color": "#666666",
					"box-shadow": "0px 0px 5px rgba(0,0,0,0.3)"
					});
				menu_li.css({"color": "#666666"});
			
				if(window.innerWidth<=991){
					$('.logo-image-6').css('display','none');
						}
						else{
						$('.logo-image-1').css('display','inherit');
					}
			}	
			
		$(document).on('scroll',function() {	
			var y = $(window).scrollTop(); 
			
				if (y >= 286) {
					menu_bar.fadeIn().addClass('fixed-header').css({
						"background-color": "#f2f2f2",
						"color": "#666666",
						"box-shadow": "0px 0px 5px rgba(0,0,0,0.3)"
						});
					menu_li.css({"color": "#666666"});
					
					if(window.innerWidth<=991){
					$('.logo-image-6').css('display','inherit');
						}
						else{
						$('.logo-image-1').css('display','none');
					}
				} 
				else {
					menu_bar.removeClass('fixed-header').css({
						"background-color": "#f2f2f2",
						"color": "#666666",
						"box-shadow": "0px 0px 5px rgba(0,0,0,0.3)"
						});
					menu_li.css({"color": "#666666"});
					if(window.innerWidth<=991){
					$('.logo-image-6').css('display','none');
						}
						else{
						$('.logo-image-1').css('display','inherit');
					}
				}	

				 var scrollPos = $(document).scrollTop()+80;
					$('#menu_1 a').each(function () {
						var currLink = $(this);
						var refElement = $(currLink.attr("href"));
						if (refElement.position().top <= scrollPos && refElement.position().top + refElement.height() > scrollPos) {
							$('#menu_1 ul li a').removeClass("active");
							currLink.addClass("active");
						}
						else{
							currLink.removeClass("active");
						}
					});
			});

			//MENU BAR SMOOTH SCROLLING FUNCTION	
			$('.pagescroll').on('click' ,function(e){
					var y = $(window).scrollTop();
					var t="";
					if (y<=230) {
						t=270;
					}
					else {						
						t=50;
					}	
				$('html, body').animate({
					scrollTop: $( $.attr(this, 'href') ).offset().top -t
				}, 2000);
				return false;
			});		
		
	return false;
		// End of use strict
});