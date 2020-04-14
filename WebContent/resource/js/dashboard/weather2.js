$(function(){
	
	var array = [];
	var today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth()+1;
	var day = today.getDate();
	var hours = today.getHours();
	var minutes = today.getMinutes();
	var hours_arr = new Array('02','05','08','11','14','17','20','23');
	var location = [{'region':'서울','nx':61,'ny':125}];
	
	// 예보 2시부터 3시간 단위
	for(var i=0; i<hours_arr.length; i++){
		var h = hours_arr[i] - hours;
		if(h==-1||h==0||h==-2){
			var now = hours_arr[i];
		}
		if(hours==00){
			var now = hours_arr[7];
		}
	}
	
	// 9시 -> 09시로 변경
	if(hours<10){
		hours='0'+hours;
	}
	
	if(month < 10) {
        month = '0' + month;
    }
	
	if(day<10){
		day='0'+day;
	}
	
	today = year + "" +month+ "" + day;
	console.log(today);
	
	// validation
	var nx = 61, 
		ny = 125,
		apikey = "nGnGQZeDOCBA0av%2FCFEdQ2%2BF0FWGr8IMLvIPq4nBmVlxkIuS1watApg3k2UWtGnpfloI1rLL2FAlnsIkkUtXvg%3D%3D";
		ForecastGribURL = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst";
	    ForecastGribURL += "?ServiceKey=" + apikey;
	    ForecastGribURL += "&base_date=" + today;
	    ForecastGribURL += "&base_time=" + hours +"00";
	    ForecastGribURL += "&nx=" + nx + "&ny=" + ny;
	    ForecastGribURL += "&pageNo=1&numOfRows=7";
	    ForecastGribURL += "&_type=json";
	    
	    console.log(ForecastGribURL);
	
	// 좌표
	$.ajax({
		crossOrigin: true,
		url : ForecastGribURL,
		type : 'get',
		dataType : 'jsonp',
		success : function(xml){
			console.log(xml);
			var text = xml.responseText,
		        text = text.replace(/(<([^>]+)>)/ig,""); //HTML 태그 모두 공백으로 대체
				text = '[' + text + ']';
				
			var json = $.parseJSON(text);
		       
	        var rain_state = json[0].response.body.items.item[1].obsrValue;
	        var rain = json[0].response.body.items.item[3].obsrValue;
	        var sky = json[0].response.body.items.item[4].obsrValue;
	        var temperature = json[0].response.body.items.item[5].obsrValue;
		       
	        console.log(JSON.stringify(xml));
	        $('.weather-temp').html(temperature.toFixed(1) + " ℃");
	        $('#RN1').html("시간당강수량 : "+ rain +"mm");
	        
	        if(rain_state != 0) {
               switch(rain_state) {
                   case 1:
                    $('.weather-state-text').html("비");
                       break;
                   case 2:
                       $('.weather-state-text').html("비/눈");
                       break;
                   case 3:
                       $('.weather-state-text').html("눈");
                       break;
               }
           }else {
           switch(sky) {
               case 1:
                   $('.weather-state-text').html("맑음");
                   break;
               case 2:
                   $('.weather-state-text').html("구름조금");
                   break;
               case 3:
                $('.weather-state-text').html("구름많음");
                   break;
               case 4:
                $('.weather-state-text').html("흐림");    
                   break;
               }    
           } //if-else 종료
		},// success
		error : function(){
			console.log("error");
			alert("ajax error >>>");
		}// error
	});
});