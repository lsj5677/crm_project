$(function(){
	
	$.get("/dashBoard/getDust.crm",function(json) {
		var dataList = json.list[14];
		var seocho = json.list[14].cityName;
		var date = json.list[14].dataTime;
		var pm10Value = json.list[14].pm10Value; // 미세먼지 농도
		var pm10ValueText = json.list[14].pm10Value;
		
		$('#dust').append('<div class="dustBox conBox">'
				+'<div class="icon dust-icon con-left-box">'+ pm10Value + '</div>'
				+'<div class="con-right-box"> <ul><li>현재 미세먼지 농도</li><li class="cityName">'+seocho+'</li><li class="pm10Value">'+pm10ValueText+'</li></ul></div>');
		
		if(pm10Value<=30) 	{
	 		$('.dust-icon').html("<i class='far fa-laugh-beam dust-icon'></i>");
			$(".pm10Value").html("미세먼지 좋음");
	 	}else if(pm10Value>30 && pm10Value<=80) {
	 		$('.dust-icon').html("<i class='far fa-meh dust-icon'></i>");
	 		$(".pm10Value").html("미세먼지 보통");
	 	}else if(pm10Value>80 && pm10Value<=150) {
	 		$('.dust-icon').html("<i class='far fa-frown dust-icon'></i>");
	 		$(".pm10Value").html("미세먼지 나쁨");
	 	}else if(pm10Value>150)  {
	 		$('.dust-icon').html("<i class='far fa-tired dust-icon'></i>");
	 		$(".pm10Value").html("미세먼지 매우나쁨");
	 	}		
		
	},'json' )    
	
});
	