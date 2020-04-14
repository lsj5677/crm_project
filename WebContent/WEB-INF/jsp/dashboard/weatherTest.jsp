<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<script type="text/javascript">
			$(function(){
				$.ajax({
					url : 'http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=1165053100',
					dataType :'xml',
					success : function(response){
						console.log(response);
						$(response).find('data').each(function(){
								var hour = $(this).find('hour').text(),
									temp = $(this).find('temp').text(),
									wfEn = $(this).find('wfEn').text(),
									wfKor = $(this).find('wfKor').text();
								
								$('#weather').append('<ul class="weatherBox">'
											/*  +'<li class="hour">' + hour + '시 <span>날씨</span> </li>' */
											 +'<li class="wfEn">' + wfEn + '</li>'
											 +'<li class="wfKor">' + wfKor + '</li>'
											 +'<li class="temp">' + temp + '<span>℃</span></li>');
				
							
							 /* 	if(wfEn=="Clear"){
									$(".wfEn").html("<i class='far weather fa-sun'></i>");
								}
							 	else if(wfEn=="Mostly Cloudy"){
									$(".wfEn").html("<i class='fas weather fa-sun'></i>");
								}
							 	else if(wfEn=="Cloudy"){
									$(".wfEn").html("<i class='fas weather fa-cloud'></i>");
								}
							 	else if(wfEn=="Rain"){
									$(".wfEn").html("<i class='fas weather fa-cloud-showers-heavy'></i>");
								}
							 	else if(wfEn=="Rain/Snow"){
									$(".wfEn").html("<i class='fas weather fa-umbrella'></i>");
								}
							 	else if(wfEn=="Snow"){
									$(".wfEn").html("<i class='fas weather fa-snowflake'></i>");
								}
							 	else (wfEn=="Shower"){
									$(".wfEn").html("<i class='fas weather fa-cloud-sun-rain'></i>");
								} */
								/* $('.weatherBox:gt(0)').hide(); */
						});
					}
				});		
			});
		</script>
	</head>
	<body>
		<div class="weather-wrap">
			<div id="weather">
											
			</div>
		</div>
		
	</body>
</html>
