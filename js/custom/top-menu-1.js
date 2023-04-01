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
		var x = top_menu.offset().top;
		if (x > 50) {
			menu_bar.fadeIn().css({
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
			
		} else {
			menu_bar.css({
				"background-color": "#f2f2f2",
				"color": "#666666",
				"box-shadow": "0px 0px 5px rgba(0,0,0,0.3)"
			});
			menu_li.css({
				"color": "#666666"
			});
			
			if(window.innerWidth<=991){
					$('.logo-image-6').css('display','none');
						}
						else{
						$('.logo-image-1').css('display','inherit');
					}
		}

		$(document).on('scroll', function() {
			var y = $(this).scrollTop();
			if (y > 50) {
				menu_bar.fadeIn().css({
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
			} else {
				menu_bar.css({
					"background-color": "#f2f2f2",
					"color": "#666666",
					"box-shadow": "0px 0px 5px rgba(0,0,0,0.3)"
				});
				menu_li.css({
					"color": "#666666"
				});
				
				if(window.innerWidth<=991){
					$('.logo-image-6').css('display','none');
						}
						else{
						$('.logo-image-1').css('display','inherit');
					}
			}
		});	
				
		//MENU BAR SMOOTH SCROLLING FUNCTION
		$('.page').on('click', function(e) {
			$('html, body').animate({
				scrollTop: $($.attr(this, 'href')).offset().top - 50
			}, 2000);
			return false;
		});		
	return false;
		// End of use strict
});