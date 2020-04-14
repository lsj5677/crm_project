var eventModal = $('#eventModal');
var modalTitle = $('.modal-title');
var editAllDay = $('#edit-allDay');
var editTitle = $('#edit-title');
var editStart = $('#edit-start');
var editStartTime = $('#edit-start-time');
var editEnd = $('#edit-end');
var editEndTime = $('#edit-end-time');
var editType = $('#edit-type');
var editColor = $('#edit-color');
var editDesc = $('#edit-desc');


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
		newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');
		newDates.endDate = moment(event.end._d).format('YYYY-MM-DD');
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
	defaultView: 'month',
	header: {
		left: 'prev,next',
		center: 'title',
		right: 'today, addButton'
	},
	views: {
		month: { columnFormat: 'dddd' },
		agendaWeek: {
			columnFormat: 'M/D ddd',
			titleFormat: 'YYYY년 M월 D일',
			eventLimit: false
		},
	},
	customButtons: {
		addButton: {
			text: '+',
			click: function() {
				alert('clicked the custom button!');
				$("#eventModal").modal('show');
				$("#modifyBtn").hide();
				
				
			}
	    }
	},
	events: function (start, end, timezone, callback) {
		$.ajax({
			type: "get",
			url: "/fullCalendar/getAllEvents.crm",
			success: function (response) {
				console.log(response);
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
				
			},
			success: function (response) {
				alert('수정: ' + newDates.startDate + ' ~ ' + newDates.endDate);
			}
		});
	},

	select: function (startDate, endDate) {
	    var today = moment();
	    startDate.set({
	    	hours: today.hours(),
	        minute: today.minutes()
	    });
	    
	    start = moment(startDate).format('YYYY-MM-DD HH:mm');
	    startDate = moment(start).format('YYYY-MM-DD');
	    startTime = moment(start).format('HH:mm');
	    endDate = moment(endDate).subtract(1, 'days');

	    endDate.set({
	    	hours: today.hours() + 1,
	        minute: today.minutes()
	    });
	    
	    end = moment(endDate).format('YYYY-MM-DD HH:mm');
	    endDate = moment(end).format('YYYY-MM-DD');
	    endTime = moment(end).format('HH:mm');
	    
	    $("#eventModal").modal('show');
	    $("#modifyBtn").hide();
	    
  		$('#eventModal').on('shown.bs.modal', function (event) {
  		    $("#edit-start").val(startDate);
  		    $("#edit-start-time").val(startTime);
  		    $("#edit-end").val(endDate);
  		    $("#edit-end-time").val(endTime);
  		});	
	},
	
	//이벤트 클릭시 수정이벤트
	eventClick: function (event) {
		editEvent(event);
	},

	locale: 'ko',
	timezone: "local",
	nextDayThreshold: "09:00:00",
	allDaySlot: true,
	displayEventTime: true,
	displayEventEnd: true,
	firstDay: 0,
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
	navLinks: false,
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

//SELECT 색 변경
$('#edit-color').change(function () {
    $(this).css('color', $(this).val());
});

$('#save-event').click(function () {
    var eventData = {
    	title: editTitle.val(),
    	start: editStart.val() + "T" +editStartTime.val(),
    	end: editEnd.val() + "T" + editEndTime.val(),
    	description: editDesc.val(),
    	backgroundColor: editColor.val(),
    	allDay: false
    };

    $("#calendar").fullCalendar('renderEvent', eventData, true);
    eventModal.find('input, textarea').val('');
    editAllDay.prop('checked', false);
    eventModal.modal('hide');

    $.ajax({
        type: "post",
        url: "/fullCalendar/addEvent.crm",
        data: eventData,
        success: function (response) {
            $('#calendar').fullCalendar('removeEvents');
            $('#calendar').fullCalendar('refetchEvents');
        }
    });
});
