<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>User List</title>
		<script src="https://code.jquery.com/jquery-3.4.0.js"></script>
		<link rel="stylesheet" href="/resource/css/common/reset.css">
      	<link rel="stylesheet" href="/resource/css/common/common.css">
	    <link rel="stylesheet" href="/resource/css/common/sub_common.css">
      <link rel="stylesheet" href="/resource/css/board/userList.css">
      <link rel="stylesheet" href="/resource/css/common/responsive.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap" rel="stylesheet">
      <script src='https://kit.fontawesome.com/a076d05399.js'></script>
      <script type="text/javascript" src="/resource/js/common/common.js"></script>
      <script type="text/javascript" src="/resource/js/common/responsive.js"></script>
      <script type="text/javascript" src="/resource/js/common/jquery.xdomainajax.js"></script>
      <script src='https://kit.fontawesome.com/a076d05399.js'></script>
      
      <script src="/resource/js/user/user.js"></script>
      	
	</head>
	<body>
		<div id="userList-wrap" class="wrap">
			<!--header-->
			<header class="header"> 
				<%@include file="../common/header.jsp" %>
			</header>
			<!-- //header -->
			
			<!-- sidebar -->
			<aside class="sidebar">
				<%@include file="../common/sidebar.jsp" %>
			</aside>
			<!-- //sidebar -->
			
			<div class="container">
				<!--board-wrap-->
				<div class="wrap board-wrap">
					<!--title-->
					<div class="title">
					<h3>My User</h3>
					</div>
					<!--//title-->
					
					<!--userList-wrap-->
					<div class="userList-wrap subWrap">
						<!--userList-left-box-->
						<div id="userList-left-box" class="userList-box contents">
							<form name="userForm" id="userForm" method="post">
								<div class="search-button">
								<input type="text" placeholder="사원이름을 검색하세요." id="keyword" name="keyword"> 
								<input type="hidden" id="search" name="search" value="name">
									<span class="searchButton">
										<button type="button" class="button crmButton">
										<i class="fa fa-search"> Search</i>
										</button>
									</span>
								</div>
								<table border="1" align="left">
								<tbody>
								<c:choose>
									<c:when test="${not empty list}">
										<c:forEach var="list" items="${list}">
											<tr>
												<td><a href="javaScript:userDetailName('<c:out value="${list.c_User_Id}"/>')"><c:out value="${list.c_User_Name}"/></a></td>
												<td><c:out value="${list.c_User_Department}"/></td>
												<td><c:out value="${list.c_User_Email}"/></td>
												<td class="ss button-align-right">
													<input type="button" value="담당 고객" class="client_List crmButton">
												</td>
											</tr>
										</c:forEach>
									</c:when>
								</c:choose>
								<tr>
									<td colspan="5" align="right" class="button-align-right">
										<input type="button" value="사원 등록" id="insertBt" class="crmButton"> 
										<input type="hidden" id="c_User_Id" name="c_User_Id">
										<input type="hidden" id="clientList" name="clientList">
									</td>
								</tr>
								</tbody>
								</table>
							</form>
						</div>
						<!--//userList-left-box-->
						<c:choose>
							<c:when test="${not empty detailVO}">
								<div class="userList-right-box userList-box contents">
									<div class="user-infomation">
										<div class="user-info-text">
											<p><c:out value="${detailVO.c_User_Name}"/>
												<em>사원</em>
											</p>
										</div>
										<div class="user-image">
											<img src="/resource/img/profile.jpg" alt="사원이미지" />
										</div>
									</div>
									<form id="userUpdateForm" name="userUpdateForm" enctype="application/x-www-form-urlencoded">
										<table id="client-list" border="1" align="left">
											<tbody>
												<tr>
													<td colspan="5" align="center">상세 정보</td>
												</tr>	
												<tr>
													<td>부서 : <c:out value="${detailVO.c_User_Department}"/></td>
												</tr>
												<tr>
													<td>생년월일 : <c:out value="${detailVO.c_User_Birth}"/></td>
												</tr>
												<tr>
													<td>이메일 : <c:out value="${detailVO.c_User_Email}"/></td>
												</tr>
												<tr>
													<td>전화번호 : <c:out value="${detailVO.c_User_Hp}"/></td>
												</tr>
												<tr>
													<td>등급 : <c:out value="${detailVO.c_User_Level}"/></td>
												</tr>
												<tr>
													<td>입사일 : <c:out value="${detailVO.c_User_Insertdate}"/></td>
												</tr>
												<tr>
													<td class="button-align-center">
														<input type="hidden" id="c_User_Id" name="c_User_Id" value="<c:out value="${detailVO.c_User_Id}"/>">
														<input type="button" value="사원 수정" id="updateBt" class="crmButton">
														<input type="button" value="사원 퇴사" id="deleteBt" class="crmButton">
													</td>
												</tr>
											</tbody>
										</table>
									</form>
								</div>
							</c:when>
							<c:when test="${not empty clientList}">
								<div class="userList-right-box userList-box contents">
									<div class="user-infomation">
										<div class="user-info-text">
											<p><em>사원</em></p>
										</div>
										<div class="user-image">
											<img src="/resource/img/profile.jpg" alt="사원이미지" />
										</div>
									</div>
									<table id="client-list" border="1" align="left">
										<tbody>
											<tr>
												<td colspan="5" align="center">고객 리스트</td>
											</tr>
											<c:forEach var="clientList" items="${clientList}">
												<tr>
													<td>고객 번호 : <c:out value="${clientList.c_Client_No}"/></td>
													<td>고객 이름 : <c:out value="${clientList.c_Client_Name}"/></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</c:when>
							<c:otherwise>
								<tr align="center"  >
									<td colspan="3">검색목록이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</div>
					<!--//userList-wrap-->
				</div>
				<!--//board-wrap-->
			</div>
			<!-- //container -->
			<!--footer-->
			<footer class="footer">
			<%@include file="../common/footer.jsp"%>
			</footer>
			<!-- //footer -->
		</div>
	</body>
</html>