<%@page import="org.springframework.web.context.request.RequestAttributes"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import= "com.crm.controller.SurveyController" %>
<%@ page import= "com.crm.vo.SurveyVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%-- <%
	request.setCharacterEncoding("UTF-8");
	List<SurveyVO> surveyList = (ArrayList)request.getAttribute("surveyList");
	System.out.println("surveyList.size() : " + surveyList.size());
	
	SurveyVO surveyData = null;
	
	Object obj = request.getAttribute("surveyList");
	surveyList = (ArrayList)obj;
%> --%>
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
		<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src='https://kit.fontawesome.com/a076d05399.js'></script>
		<script type="text/javascript" src="/resource/js/common/common.js"></script>
		<script type="text/javascript" src="/resource/js/common/responsive.js"></script>
		<script type="text/javascript" src="/resource/js/common/jquery.xdomainajax.js"></script>
		<script src='https://kit.fontawesome.com/a076d05399.js'></script>	
		<script type="text/javascript">
			$(function(){
				$(".goDetail").click(function(){
					/* var c_client_no = $(this).parents("tr").attr("data-num"); */
					var c_num = $(this).parents("tr").attr("data-num");
					/* $("#c_client_no").val(c_client_no); */
					$("#c_num").val(c_num);
					$("#detailForm").attr({
						"method":"get",
						"action":"/survey/surveyDetail.crm"
					});
					$("#detailForm").submit();
				});
			});
		</script>
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
				<div class="userList-wrap subWrap">
					<div class="contents">
						<form id="detailForm" name="detailForm" enctype="application/x-www-form-urlencoded">
							<table id="surveyWrite" border="1">
								<tr>
									<td>고객번호</td>
									<!-- <input type="hidden" name="c_client_no" id="c_client_no"> -->
									<input type="hidden" name="c_num" id="c_num">
									<td>고객명</td>
									<td>설문목록</td>
									<td>받은날짜</td>
									<td>만족도</td>
								</tr>
								<c:choose>
									<c:when test="${not empty surveyList}">
										<c:forEach var="survey" items="${surveyList}" varStatus="status">
											<!-- <tr data-num="${survey.c_client.no}"> -->
											<tr data-num="${survey.c_num}">
											<!-- <td>${survey.c_client_no }</td> -->
											<td>${survey.c_num}</td>
											<td>${survey.c_client_name}</td>
											<td><span class="goDetail">${survey.c_client_email}</span></td>
											<td>${survey.c_getdate}</td>
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