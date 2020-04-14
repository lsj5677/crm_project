<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
					<h3>User List</h3>
					<p>사원리스트</p>
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
								<table border="1" align="center">
								<tr align="center">
									<th>이름</th>
									<th>부서</th>
									<th>이메일</th>
									<th></th>
								</tr>
								<tbody>
								<c:choose>
									<c:when test="${not empty userList}">
										<c:forEach var="list" items="${userList}">
											<tr align="center">
												<th><a href="javaScript:userDetailName('<c:out value="${list.c_User_Id}"/>')"><c:out value="${list.c_User_Name}"/></a></th>
												<th><c:out value="${list.c_User_Department}"/></th>
												<th><c:out value="${list.c_User_Email}"/></th>
												<th class="button-align-right">
													<input type="button" value="고객 리스트" class="client_List crmButton">
													<input type="hidden" value="<c:out value="${list.c_User_Id}"/>">
												</th>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td>검색한 사원이 없습니다<td>
										<td>
									</c:otherwise>
								</c:choose>
								</tbody>
								</table>
								<div class="align-right">
									<c:choose>
										<c:when test="${userLevel eq 0}">
											<input type="button" value="사원 등록" id="insertBt" class="crmButton button-margin-top">
										</c:when>
									</c:choose>
										<input type="hidden" id="c_ClientList" name="c_ClientList"> 
										<input type="hidden" id="c_User_Id" name="c_User_Id">
								</div>
								<div align="center" id="boardPage">		
									<c:if test="${paging.startPage != 1 }">
										<a href="/user/userList.crm?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
									</c:if>
									<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
										<c:choose>
											<c:when test="${p == paging.nowPage }">
												<b>${p }</b>
											</c:when>
											<c:when test="${p != paging.nowPage }">
												<a href="/user/userList.crm?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
											</c:when>
										</c:choose>
									</c:forEach>
									<c:if test="${paging.endPage != paging.lastPage}">
										<a href="/user/userList.crm?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
									</c:if>
								</div>
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
												
											</tbody>
										</table>
										<div class="align-right">
											<input type="hidden" id="user_Id" name="user_Id" value="<c:out value="${detailVO.c_User_Id}"/>">
											<c:choose>
												<c:when test="${userLevel eq 0}">
													<input type="button" value="사원 수정" id="updateBt" class="crmButton button-margin-top">
													<input type="button" value="사원 퇴사" id="deleteBt" class="crmButton button-margin-top">
												</c:when>
											</c:choose>
										</div>
									</form>
								</div>
							</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${not empty clientList}">
									<div class="userList-right-box userList-box contents">
										<div class="user-infomation">
											<div class="user-info-text">
												<p><em><c:out value="${clientList[0].c_User_Id}"/></em></p>
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