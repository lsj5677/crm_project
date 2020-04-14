$(function(){
	// header notification, user-info dropdown
	$('.dropdown-button').click(function(e) {
		console.log(123);
		$(this).children('.dropdown-wrap').fadeToggle();

		$('.dropdown-wrap').not($(this).children()).hide();
		e.stopPropagation();
	});

	// 빈 공간 클릭 하면 dropdown hide
	$('html').click(function() {
		$('.dropdown-wrap').hide();
	});

	// sidebar click
	$('.sidebar-1depth-menu > a').click(function() {
		var sidebarMenu = $('.sidebar-1depth-menu > a');

		if (sidebarMenu.hasClass('menu-on')) {
			sidebarMenu.removeClass('menu-on')
			$(this).addClass('menu-on');
		} else {
			$(this).removeClass('menu-on');
		}
	});

	// sidebar 2depth menu
	$('.slide-toggle').click(
			function() {
				$(this).siblings().slideToggle();
				$('.sidebar-menu-content > ul > li > a > i.fa-right').toggleClass(
						'fa-rotate');
			});

	// test alert
	$('.input-button').click(function() {
		alert('button click >>>');
	});
});
