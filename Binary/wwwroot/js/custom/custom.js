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
		
		//RESPONSIVE MENU SHOW AND HIDE FUNCTION
		menu_li.on("click", function(event) {
			collapse.slideToggle();
		});
		$('.navbar-default .navbar-toggle').click(function(e) {
			collapse.slideToggle();
		});

		//RESPONSIVE MENU BGCOLOR
		$('.navbar-header button').on('click', function(e) {
			$('#bs-example-navbar-collapse-1').css({
				"background-color": "#f2f2f2"
			});
			$('#bs-example-navbar-collapse-1 li a').css({
				"color": "#666666"
			});
		});
		
		//PRINT RESUME FUNCTION
		$('#printerButton').on("click", function(event){			  
			var myWindow = window.open('download-resume.html','My Resume', 'width=1000');			
			myWindow.focus();
			myWindow.print();
		});

		//HEADER SLIDER FUNCTION
		$('.carousel').carousel({
			interval: 2000
		})

		// YOUTUBE BACKGROUND VIDEO FUNCTION	
		var player=$('.player');
		if(player.length) {
			player.mb_YTPlayer();					
		}
		
		//CONTACT FORM VALIDATION	
		if ($('#contact-form').length) {
			$('#contact-form').each(function(){
				$(this).validate({			
					errorClass: 'error',
					submitHandler: function(form){
						$.ajax({
							type: "POST",
							url:"mail/mail.php",
							data: $(form).serialize(),
							success: function(data) {							
							   if(data){
								   $('#sucessMessage').html('Mail Sent Successfully !');
								   $('#sucessMessage').show();
								   $('#sucessMessage').delay(3000).fadeOut();
							   }
							   else {
									$('#failMessage').html(data);
									$('#failMessage').show();
									$('#failMessage').delay(3000).fadeOut();
									}
							},
							error: function(XMLHttpRequest, textStatus, errorThrown) {
							   $('#failMessage').html(textStatus);
							   $('#failMessage').show();
							   $('#failMessage').delay(3000).fadeOut();
							 }
						});
					}				
				});
			});
		};				
	return false;
		// End of use strict
});