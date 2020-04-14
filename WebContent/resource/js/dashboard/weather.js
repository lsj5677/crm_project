$(function(){
	
	$.get("/dashBoard/getWeather.crm",function(xml) {
		$(xml).find('data').each(function(){
			var hour = $(this).find('hour').text(),
				temp = $(this).find('temp').text(),
				wfEn = $(this).find('wfEn').text(),
				wfKor = $(this).find('wfKor').text();
			
//			console.log(temp);
//			console.log(wfEn);
//			console.log(wfKor);
			
//			$('#weather').append('<ul class="weatherBox conBox">'
//				 +'<li class="wfEn">' + wfEn + '</li>'
//				 +'<li class="wfKor">' + wfKor + '</li>'
//				 +'<li class="temp">' + temp + '<span>℃</span></li>');
			
			$('#weather').append('<div class="weatherBox conBox">'
					
				+'<div class="icon wfEn con-left-box">'+ wfEn + '</div>'
				+'<div class="con-right-box"> <ul><li>현재 날씨</li><li class="wfKor">'+wfKor+'"</li><li class="temp">'+temp+'<span>℃</span></li></ul></div>');

		 	if(wfEn=="Clear") 	{
		 		$(".wfEn").html("<i class='far weather fa-sun'></i>");
		 	}else if(wfEn=="Mostly Cloudy") {
		 		$(".wfEn").html("<i class='fas weather fa-cloud'></i>");
		 	}else if(wfEn=="Cloudy") {
		 		$(".wfEn").html("<i class='fas weather fa-cloud'></i>");
		 	}else if(wfEn=="Rain")  {
		 		$(".wfEn").html("<i class='fas weather fa-cloud-showers-heavy'></i>");
		 	}else if(wfEn=="Rain/Snow") {
		 		$(".wfEn").html("<i class='fas weather fa-umbrella'></i>");
		 	}else if(wfEn=="Snow") {
		 		$(".wfEn").html("<i class='fas weather fa-snowflake'></i>");
		 	}else if(wfEn=="Shower") {
		 		$(".wfEn").html("<i class='fas weather fa-cloud-sun-rain'></i>");
		 	}	
		 	$('.weatherBox:gt(0)').hide();
		});
	},'xml' )
	
});
	