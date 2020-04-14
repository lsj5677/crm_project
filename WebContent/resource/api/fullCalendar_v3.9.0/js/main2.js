var draggedEventIsAllDay;
var activeInactiveWeekends = true;

function getDisplayEventDate(event) {
	var displayEventDate;
	
	if (event.allDay == false) {
		var startTimeEventInfo = moment(event.start).format('HH:mm');
		var endTimeEventInfo = moment(event.end).format('HH:mm');
		displayEventDate = startTimeEventInfo + " - " + endTimeEventInfo;
	} else {
		displayEventDate = "하루종일";
	}
	return displayEventDate;
}// getDisplayEventDate()

function calDateWhenResize(event) {
	var newDates = {
		startDate: '',
		endDate: ''
	};

	if (event.allDay) {
		newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');
		newDates.endDate = moment(event.end._d).subtract(1, 'days').format('YYYY-MM-DD');
	} else {
		newDates.startDate = moment(event.start._d).format('YYYY-MM-DD HH:mm');
		newDates.endDate = moment(event.end._d).format('YYYY-MM-DD HH:mm');
	}
	return newDates;
}// calDateWhenResize()

function calDateWhenDragnDrop(event) {
	// 드랍시 수정된 날짜반영
	var newDates = {
		startDate: '',
		endDate: ''
	}
	// 날짜 & 시간이 모두 같은 경우
	if(!event.end) { event.end = event.start; }
	
	//하루짜리 all day
	if (event.allDay && event.end === null) {
		newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');
		newDates.endDate = newDates.startDate;
	}
	//2일이상 all day
	else if (event.allDay && event.end !== null) {
		newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');
		newDates.endDate = moment(event.end._d).subtract(1, 'days').format('YYYY-MM-DD');
	}
	//all day가 아님
	else if (!event.allDay) {
		newDates.startDate = moment(event.start._d).format('YYYY-MM-DD HH:mm');
		newDates.endDate = moment(event.end._d).format('YYYY-MM-DD HH:mm');
	}
	return newDates;
}// calDateWhenDragnDrop()

var calendar = $('#calendar').fullCalendar({
	header: {
		left: 'prev,next, today',
		center: 'title',
		right: 'month,agendaDay'
	},
	views: {
		month: { columnFormat: 'dddd' },
		agendaWeek: {
			columnFormat: 'M/D ddd',
			titleFormat: 'YYYY년 M월 D일',
			eventLimit: false
		},
		agendaDay: {
			columnFormat: 'dddd',
			eventLimit: false
		},
		listWeek: {
			columnFormat: ''
		}
	},

	/* ****************
	 *  일정 받아옴 
	 * ************** */
	events: function (start, end, timezone, callback) {
		$.ajax({
			type: "get",
			url: "/resource/api/fullCalendar_v3.9.0/data.json",
			data: {
				// 실제 사용시, 날짜를 전달해 일정기간 데이터만 받아오기를 권장
			},
			success: function (response) {
				var fixedDate = response.map(function (array) {
					if (array.allDay && array.start !== array.end) {
						// 이틀 이상 AllDay 일정인 경우 달력에 표기시 하루를 더해야 정상출력
						array.end = moment(array.end).add(1, 'days');
					}
					return array;
				})
				callback(fixedDate);
			}
		});
	},

	eventAfterAllRender: function (view) {
		if (view.name == "month") {
			$(".fc-content").css('height', 'auto');
		}
	},

	//일정 리사이즈
	eventResize: function (event, delta, revertFunc, jsEvent, ui, view) {
		$('.popover.fade.top').remove();

	    /** 리사이즈시 수정된 날짜반영
	     * 하루를 빼야 정상적으로 반영됨. */
	    var newDates = calDateWhenResize(event);
	
	    //리사이즈한 일정 업데이트
	    $.ajax({
	    	type: "get",
	    	url: "",
	    	data: {
	    		//id: event._id,
	    		//....
	    	},
	    	success: function (response) {
	    		alert('수정: ' + newDates.startDate + ' ~ ' + newDates.endDate);
	    	}
	    });
	},

	eventDragStart: function (event, jsEvent, ui, view) {
		draggedEventIsAllDay = event.allDay;
	},

	//일정 드래그앤드롭
	eventDrop: function (event, delta, revertFunc, jsEvent, ui, view) {
		$('.popover.fade.top').remove();

		//주,일 view일때 종일 <-> 시간 변경불가
		if (view.type === 'agendaWeek' || view.type === 'agendaDay') {
			if (draggedEventIsAllDay !== event.allDay) {
				alert('드래그앤드롭으로 종일<->시간 변경은 불가합니다.');
				location.reload();
				return false;
			}
		}

		// 드랍시 수정된 날짜반영
		var newDates = calDateWhenDragnDrop(event);

		//드롭한 일정 업데이트
		$.ajax({
			type: "get",
			url: "",
			data: {
				//...
			},
			success: function (response) {
				alert('수정: ' + newDates.startDate + ' ~ ' + newDates.endDate);
			}
		});
	},

	select: function (startDate, endDate, jsEvent, view) {
	    $(".fc-body").unbind('click');
	    $(".fc-body").on('click', 'td', function (e) {
	    	alert("click");
	    	$("#eventModal").modal('show');
	    });

	    var today = moment();
	    if (view.name == "month") {
	    	alert(view.name);
	    	startDate.set({
	    		hours: today.hours(),
	    		minute: today.minutes()
	    	});
	    	startDate = moment(startDate).format('YYYY-MM-DD HH:mm');
	    	
	    	endDate = moment(endDate).subtract(1, 'days');
	    	endDate.set({
	    		hours: today.hours() + 1,
	    		minute: today.minutes()
	    	});
	    	endDate = moment(endDate).format('YYYY-MM-DD HH:mm');
	    } else {
	      startDate = moment(startDate).format('YYYY-MM-DD HH:mm');
	      endDate = moment(endDate).format('YYYY-MM-DD HH:mm');
	    }
	},

	//이벤트 클릭시 수정이벤트
	eventClick: function (event, jsEvent, view) {
		editEvent(event);
	},

	  locale: 'ko',
	  timezone: "local",
	  nextDayThreshold: "09:00:00",
	  allDaySlot: true,
	  displayEventTime: true,
	  displayEventEnd: true,
	  firstDay: 0, //월요일이 먼저 오게 하려면 1
	  weekNumbers: false,
	  selectable: true,
	  weekNumberCalculation: "ISO",
	  eventLimit: true,
	  views: {
		  month: {
			  eventLimit: 12
		  }
	  },
	  eventLimitClick: 'week', //popover
	  navLinks: true,
	  timeFormat: 'HH:mm',
	  defaultTimedEventDuration: '01:00:00',
	  editable: true,
	  minTime: '00:00:00',
	  maxTime: '24:00:00',
	  slotLabelFormat: 'HH:mm',
	  weekends: true,
	  nowIndicator: true,
	  dayPopoverFormat: 'MM/DD dddd',
	  longPressDelay: 0,
	  eventLongPressDelay: 0,
	  selectLongPressDelay: 0
});