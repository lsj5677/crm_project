var eventModal = $('#eventModal');

var modalTitle = $('.modal-title');
var editTitle = $('#edit-title');
var editStart = $('#edit-start');
var editStartTime = $('#edit-start-time');
var editEnd = $('#edit-end');
var editEndTime = $('#edit-end-time');
var editType = $('#edit-type');
var editColor = $('#edit-color');
var editDesc = $('#edit-desc');

var addBtnContainer = $('#addBtn');
var modifyBtnContainer = $('#modifyBtn');


/* ****************
 *  새로운 일정 생성
 * ************** */



    //새로운 일정 저장버튼 클릭
    $('#save-event').unbind();
    $('#save-event').on('click', function () {

        var eventData = {
            _id: eventId,
            title: editTitle.val(),
            start: editStart.val(),
            startTime: editStartTime(),
            end: editEnd.val(),
            endTime: editEndTime(),
            description: editDesc.val(),
            type: editType.val(),
            backgroundColor: editColor.val(),
            textColor: '#ffffff',
            allDay: false
        };

        if (eventData.start > eventData.end) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (eventData.title === '') {
            alert('일정명은 필수입니다.');
            return false;
        }

        var realEndDay;

        if (editAllDay.is(':checked')) {
            eventData.start = moment(eventData.start).format('YYYY-MM-DD');
            //render시 날짜표기수정
            eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD');
            //DB에 넣을때(선택)
            realEndDay = moment(eventData.end).format('YYYY-MM-DD');

            eventData.allDay = true;
        }

        $("#calendar").fullCalendar('renderEvent', eventData, true);
        eventModal.find('input, textarea').val('');
        editAllDay.prop('checked', false);
        eventModal.modal('hide');

        alert(eventData);
        
        //새로운 일정 저장
        $.ajax({
            type: "get",
            url: "/fullcalendar/addEvent.crm",
            data: {
            	eventData
            },
            success: function (response) {
                //DB연동시 중복이벤트 방지를 위한
                //$('#calendar').fullCalendar('removeEvents');
                //$('#calendar').fullCalendar('refetchEvents');
            }
        });
    });
