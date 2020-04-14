<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html!>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Dashboard</title>
		<link rel="stylesheet" href="/resource/css/common/reset.css">
		<link rel="stylesheet" href="/resource/css/common/common.css">		
		<link rel="stylesheet" href="/resource/css/common/sub_common.css">
		<link rel="stylesheet" href="/resource/css/common/dashboard.css">
		<link rel="stylesheet" href="/resource/css/common/responsive.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap" rel="stylesheet">
		
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src='https://kit.fontawesome.com/a076d05399.js'></script>
		<script type="text/javascript" src="/resource/js/common/common.js"></script>
		<script type="text/javascript" src="/resource/js/common/responsive.js"></script>
		<script type="text/javascript" src="/resource/js/common/jquery.xdomainajax.js"></script>
		<script src='https://kit.fontawesome.com/a076d05399.js'></script>	
		
		<script src="/resource/js/chart/tsales.js"></script>
		<script src="/resource/js/performance/performance.js"></script>
		<script src="/resource/js/dashboard/weather.js"></script>
		<script src="/resource/js/dashboard/dust.js"></script>
		<script src="/resource/js/dashboard/exRate.js"></script>
		<script src="/resource/js/dashboard/boardNotice.js"></script>
		
		
	</head>
	<body>
		<!--wrap-->
		<div class="wrap">
		
			<!--header-->
			<header class="header"> 
				<%@include file="./common/header.jsp" %>
			</header>
			<!-- //header -->
			
			<!-- sidebar -->
			<aside class="sidebar">
				<%@include file="./common/sidebar.jsp" %>
			</aside>
			<!-- //sidebar -->
			
			<!-- container -->
			<div class="container">
			
				<!-- sub-container -->
				<div class="sub-container flex-section">
					<!-- sub-container-contents-->
					<div class="sub-container-contents col col-2 res-margin-none">
						<div class="noticeBox">
							<table id="noticeTable">
							</table>
						</div>
					</div>
					<!-- //sub-container-contents-->
					<!-- sub-container-contents-->
					<div class="sub-container-contents col col-2">
						<!-- weather-box -->
						<div class="weather-box col-sub-2 weather-wrap" id="weather"></div>
						<!-- //weather-box -->
						
						<!-- dust-box -->
						<div class="dust-box col-sub-2 weather-wrap" id="dust"></div>
						<!-- //dust-box -->
					</div>
					<!-- //sub-container weather/dust-->
				</div>
				<!-- //container section-1 -->
				
				<!-- sub-container chart-->
				
				<div class="sub-container">
					<canvas id="myChart"></canvas>		
				</div>
				<!-- //sub-container chart-->
				<!-- sub-container -->
				<div class="sub-container">
					<!-- sub-container-contents -->
					<div class="sub-container-contents">
						<!-- exRate-box -->
						<div class="exRate-box exRate-wrap" id="exRate"></div>
						<!-- //exRate-box -->
					</div>
				</div>
				<!-- //sub-container-->
			</div>
			<!-- //container -->
			
			<!--footer-->
			<footer class="footer">
				<%@include file="./common/footer.jsp" %>
			</footer>
			<!-- //footer -->
		</div>
		<!-- //wrap -->
	</body>
</html>
