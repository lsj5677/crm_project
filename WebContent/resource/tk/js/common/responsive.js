$(function(){
	// 780px 이상
	if ($(window).width() > 780) {
		var sidebarSlide = 1;
		$('.header-sidebar-menu-icon').click(function() {
			if (sidebarSlide == 0) {
				$('.sidebar').animate({
					'left' : '0'
				}, 500);
				sidebarSlide = 1;
			}
	
			else {
				$('.sidebar').animate({
					'left' : '-220px'
				}, 500);
				sidebarSlide = 0;
			}
		});
	}
	
	// 780px 이하
	if ($(window).width() < 780) {
		var sidebarSlide = 0;
		$('.header-sidebar-menu-icon').click(function() {
			if (sidebarSlide == 0) {
				$('.sidebar').animate({
					'left' : '0'
				}, 500);
				sidebarSlide = 1;
			}
	
			else {
				$('.sidebar').animate({
					'left' : '-220px'
				}, 500);
				sidebarSlide = 0;
			}
		});
	}
});