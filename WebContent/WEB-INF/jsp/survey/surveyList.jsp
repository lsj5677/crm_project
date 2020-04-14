<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Survey List</title>
		<link rel="stylesheet" href="/resource/css/common/reset.css">
		<link rel="stylesheet" href="/resource/css/common/common.css">
		<link rel="stylesheet" href="/resource/css/common/sub_common.css">
		<link rel="stylesheet" href="/resource/css/common/responsive.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.4.0.js"></script>
		<script src='https://kit.fontawesome.com/a076d05399.js'></script>
		<script src="/resource/js/common/common.js"></script>
		<script src="/resource/js/common/responsive.js"></script>
		<script src="/resource/js/common/jquery.xdomainajax.js"></script>
		<script src='https://kit.fontawesome.com/a076d05399.js'></script>	
		
		<script src="/resource/js/survey/survey.js"></script>
		
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
					<h3>Survey List</h3>
					<p>만족도 조사</p>
				</div>	
				<!--userList-wrap-->
				<div class="subWrap">
					<div class="contents">
						<form id="detailForm" name="detailForm" method="post">
									<div class="search-button">
								
									<input type="text" placeholder="고객이름을 검색하세요." id="keyword" name="keyword"> 
									<span class="searchButton">
										<button type="button" class="button crmButton">
											<i class="fa fa-search"> Search</i>
										</button>
									</span>
									</div>
							<table id="surveyWrite" border="1" align="left" class="table-margin-top">
								<tr>
									<td class="res-none-mo res-none-spc">고객번호</td>
									<input type="hidden" name="c_client_no" id="c_client_no">
									<td>고객명</td>
									<td>설문목록</td>
									<td class="res-none-mo">받은날짜</td>
									<td>만족도</td>
								</tr>
								<c:choose>
									<c:when test="${not empty surveyList}">
										<c:forEach var="survey" items="${surveyList}" varStatus="status">
											<tr data-num="${survey.c_client_no}">
												<td class="res-none-mo res-none-spc">${survey.c_client_no }</td>
												<td>${survey.c_client_name}</td>
												<td class="boardTitle"><span class="goDetail">${survey.c_client_email}</span></td>
												<td class="res-none-mo">${survey.c_getdate}</td>
												<td>${survey.c_overall}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="5">등록된 게시물이 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</table>
							<div style="display: block; text-align: center;" id="boardPage">
							 	<c:if test="${paging.startPage != 1 }">
							 		<a href="/survey/surveyList.crm?nowPage=${paging.startPage -1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
							 	</c:if>
									<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
										<c:choose>
											<c:when test="${p==paging.nowPage }">
												<b>${p }</b>
											</c:when>
											<c:when test="${p!=paging.nowPage }">
												<a href="/survey/surveyList.crm?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
											</c:when>
										</c:choose>
									</c:forEach>
								<c:if test="${paging.endPage!=paging.lastPage }">
									<a href="/survey/surveyList.crm?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
								</c:if>
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
	</body>
</html>