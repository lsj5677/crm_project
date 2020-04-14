$(function(){
	
	var labelsDate = [];
	var date = [];
	var ctx = document.getElementById('myChart').getContext('2d');
	
	function ssss(){
		var myChart = new Chart(ctx, {
			type: 'bar',
		    data: {
		        labels: labelsDate,
		        datasets: [{
		        	label: '실적',
		            data: date,
		            borderColor : "rgba(5, 84, 173, 1)",
		            backgroundColor: "rgba(5, 84, 173, 1)",
		            borderWidth: 1
		        }]
		    },
		    options: {
		        maintainAspectRatio: false, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
		        scaleBeginAtZero : true,
		        scales: {
		            yAxes: [{
		                ticks: {
		                    beginAtZero:true
		                }
		            }]
		        }
		    }
		});
	}
	    
	
    $( "#datepicker" ).datepicker({
    	dateFormat: 'y/mm/dd' //Input Display Format 변경
       ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
       ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
       ,changeYear: true //콤보박스에서 년 선택 가능
       ,changeMonth: true //콤보박스에서 월 선택 가능                
       ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
       ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
       ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
       ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
       ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
       ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
       ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
       ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
       ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
    });
    
    $('#datepicker').datepicker('setDate', 'today');
    var today = $("#datepicker").val();
    
    $.ajax({ 
		url: "/performance/performanceResult.crm", 
		type: "get", 
		dataType : 'json',
		data:{
			datepicker : today
		},
		success: function(data){ 
			console.log(data);
			console.log(data[0].c_Performance_Insertdate);
			for(var key in data){
				labelsDate.unshift(data[key].c_Performance_Insertdate)
				date.unshift(data[key].c_Performance_Result)
			}
			
			console.log(labelsDate);
			console.log(date);
			// 기본값
//			test(date, labelsDate);
			myChart = new Chart(ctx,{
				type: "bar",
				data: {
					labels : labelsDate,
					datasets: [{
			            label: "실적",
			            data: date,
			            borderColor : "rgba(5, 84, 173, 1)",
			            backgroundColor: "rgba(5, 84, 173, 1)",
			            borderWidth: 1
			        }]
				}
			});
		} 
	});
    
    $("#datepicker").on("change", function(){
    	today = $(this).val();
    	$.ajax({ 
    		url: "/performance/performanceResult.crm", 
    		type: "get", 
    		dataType : 'json',
    		data:{
    			datepicker : today
    		},
    		success: function(data){ 
    			console.log(data);
    			console.log(data[0].c_Performance_Insertdate);
    			labelsDate = [];
    			date = [];
    			for(var key in data){
    				labelsDate.unshift(data[key].c_Performance_Insertdate)
    				date.unshift(data[key].c_Performance_Result)
    			}
    			
    			console.log(labelsDate);
    			console.log(date);
    			myChart.destroy();
    			test(date, labelsDate);
    		} 
    	});
    });
  
    function test(date, labelsDate){
    	myChart = new Chart(ctx,{
			type: "bar",
			data: {
				labels : labelsDate,
				datasets: [{
					label: '실적',
		            data: date,
		            borderColor : "rgba(5, 84, 173, 1)",
		            backgroundColor: "rgba(5, 84, 173, 1)",
		            borderWidth: 1
		        }]
			}
		});
    }
    
    $("#performaceList").click(function(){
    	location.href="/performance/performanceList.crm"
    });
    
   
    
});
