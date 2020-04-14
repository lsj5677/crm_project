<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Survey Detail</title>
		<link rel="stylesheet" href="/resource/css/common/reset.css">
		<link rel="stylesheet" href="/resource/css/common/common.css">
		<link rel="stylesheet" href="/resource/css/common/sub_common.css">
		<link rel="stylesheet" href="/resource/css/board/surveyDetail.css">
		<link rel="stylesheet" href="/resource/css/common/responsive.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src='https://kit.fontawesome.com/a076d05399.js'></script>
		<script src="/resource/js/common/common.js"></script>
		<script src="/resource/js/common/responsive.js"></script>
		<script src="/resource/js/common/jquery.xdomainajax.js"></script>
		<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	</head>
	<body>
		<div class="wrap">
			<!--header-->
			<header class="header">
				<%@include file="../common/header.jsp"%>
			</header>
			<!-- //header -->
	
			<!-- sidebar -->
			<aside class="sidebar">
				<%@include file="../common/sidebar.jsp"%>
			</aside>
			<!-- //sidebar -->
	
			<div class="container">
		<div class="wrap board-wrap">	
			<!--title-->
			<div class="title">	
				<h3>Survey Detail</h3>
				<p>고객만족도 설문조사서</p>
			</div>	
			
			<div class="subWrap">
				<div class="contents">
					<form id="sform" name="sform" method="post">
						<div class="essential cgroup">
							*고객명:<input type="text" id="c_client_name" name="c_client_name" readonly="readonly" value="${detail.c_client_name}">
							*이메일:<input type="text" id="c_client_email" name="c_client_email" readonly="readonly" value="${detail.c_client_email}">
							*담당사원:<input type="text" id="c_user_name" name="c_user_name" readonly="readonly" value="${detail.c_user_name}">
						</div>
	
						<div class="essential essential-item">	
							<div id="q1">
								<h3>1. 브랜드 서비스에 대해 평가해주세요.</h3>
							</div> 
	
							<div id="selection">
								<label><input type="text" name="c_overall" value="${detail.c_overall}" checked readonly="readonly" ></label>
							</div>
						</div>
	
						<div class="essential essential-item">
							<div id="q2">
								<h3>2. 가장 만족스러우셨던 서비스 부분을 체크해주세요:</h3>
							</div>
							<div id="checkbox">
								<label><input type="text" name="c_satisf" value="${detail.c_satisf}" checked readonly="readonly" ></label>
							</div>
						</div>
	
						<div class="essential essential-item">
							<div id="q3">
								<h3>3. 가장 만족스럽지 못하신 서비스 부분을 체크해주세요:</h3>
							</div>
							<div id="checkbox2">
								<label><input type="text" name="c_feedback" value="${detail.c_feedback}" checked readonly="readonly" ></label>
							</div>
						</div>
	
						<div class="essential essential-item">
							<div id="q4">
								<h3>4. 본 매장의 방문을 주변인에게 추천해줄 의향이 있으십니까?</h3>
							</div>
							<div id="radioBtn">
								<label><input type="text" name="c_recommend" value="${detail.c_recommend}" checked readonly="readonly" ></label>
							</div>
						</div>
						<div id="q5 essential-item">
							<h3>5. 고객님의 의견을 들려주세요.</h3>
						</div>
						<div id="opitext">
							<textarea class="opini_content" readonly="readonly" >${detail.c_opinion}</textarea>
						</div>
					</form>
				</div>	
			</div>
		</div>
		</div>
		<!--footer-->
		<footer class="footer">
			<%@include file="../common/footer.jsp"%>
		</footer>
		<!-- //footer -->
	</div>
</html>