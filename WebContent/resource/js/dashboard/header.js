var today = new Date().toISOString().slice(0,10);

$.get("/fullCalendar/getTodayEvents.crm?start=" + today, function(data) {
			console.log(data);
			
			$(".notification-badge").text(data.length);
			
			for(event in data) {
				var title =  data[event].title;
				var start = data[event].start.substring(11);
				var end = data[event].end.substring(11);
				
				$('#todayEvents').append('<li class="event">'
						+'<a href="#"><i class="fa fa-envelope fa-sm"><span> '+ title + " " + start +'</span></a>');
			}
},'json')
	