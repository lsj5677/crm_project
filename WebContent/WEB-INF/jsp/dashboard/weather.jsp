<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			$(function() {
				var list = "";
				
				$.ajax({
						url : "weather/weatherApi.crm",
						type : "get",
						dataType: "json",
						contentType: "application/json",
						success : function(data) {
			 				console.log(data); 
							/* console.log(JSON.stringify(data)); */
							console.log("data >>> " + data);					
							console.log(":::"+Object.keys(data));
							 
							var baseDate = data.response.body.items.item[0].baseDate,
			                fcstTime = data.response.body.items.item[0].fcstTime,
			                category = data.response.body.items.item[0].category; 
			               	
			               	console.log("baseDate >>> " + baseDate);
			               	console.log("fcstTime >>> " + fcstTime);
			               	console.log("category >>> " + category);
							
							 var contentText = document.getElementById('list');
			           		 contentText.innerHTML = "날짜 : " + baseDate + " / 발표시간 : " + fcstTime + " / 날씨 :" + category;  
		
			           		
			           		/* 
						       
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
						               } //if 종료 */
						},
						error : function(error){
							alert("Error >>>");
						}
					});
		
			});
		</script>
	</head>
	<body>
	
		<div>
			<div>
				<p id="list">
				</p>
			</div>
		</div>
	</body>
</html>
