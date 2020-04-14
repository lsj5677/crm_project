<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Client List</title>	
		<script src="https://code.jquery.com/jquery-3.4.0.js"></script>
		<link rel="stylesheet" href="/resource/css/common/reset.css">
		<link rel="stylesheet" href="/resource/css/common/common.css">
		<link rel="stylesheet" href="/resource/css/common/sub_common.css">
		<link rel="stylesheet" href="/resource/css/common/responsive.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap" rel="stylesheet">
		<script src='https://kit.fontawesome.com/a076d05399.js'></script>
		<script type="text/javascript" src="/resource/js/common/common.js"></script>
		<script type="text/javascript" src="/resource/js/common/responsive.js"></script>
		<script type="text/javascript" src="/resource/js/common/jquery.xdomainajax.js"></script>
		<script src='https://kit.fontawesome.com/a076d05399.js'></script>	
		
		<script src="/resource/js/client/clientList.js"></script>
		<script src="/resource/js/common/user_Client_Common.js"></script>
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
				<!--board-wrap-->
				<div class="wrap board-wrap">	
					<!--title-->
					<div class="title">	
						<h3>Client List</h3>
						<p>고객리스트</p>
					</div>	
					
					<div class="subWrap">
						<div class="contents">
			
							<form name="clientForm" id="clientForm" method="post">
									<div class="search-button">
									<input type="text" placeholder="고객이름을 검색하세요." id="keyword" name="keyword"> 
									<input type="hidden" id="search" name="search" value="name">
									
									<span class="searchButton">
										<button type="button" class="button crmButton">
											<i class="fa fa-search"> Search</i>
										</button>
									</span>
									</div>
									<table border="1" align="center" class="table-margin-top">
									<tr align="center">
										<th>이름</th>
										<th>생년월일</th>
										<th class="res-none-mo">전화번호</th>
										<th class="res-none-mo res-none-spc">이메일</th>
										<th class="res-none-mo res-none-spc">주소</th>
										<th>담당직원</th>	
									</tr>	
									<tbody>
										<c:choose>
											<c:when test="${not empty clientList}">
												<c:forEach var="clientVO" items="${clientList}">
													<tr>
														<td>
															<a href="javaScript:clientName('<c:out value="${clientVO.c_Client_No}"/>')"><c:out value="${clientVO.c_Client_Name}"/></a>
														</td>
														<td><c:out value="${clientVO.c_Client_Birth}"/></td>
														<td class="res-none-mo"><c:out value="${clientVO.c_Client_Hp}"/></td>
														<td class="res-none-mo res-none-spc"><c:out value="${clientVO.c_Client_Email}"/></td>
														<td class="res-none-mo res-none-spc">
															<c:out value="${clientVO.c_Client_Addr}"/>
															<c:out value="${clientVO.c_Client_Addr2}"/>
															<c:out value="${clientVO.c_Client_Addr3}"/>
														</td>
														<td><c:out value="${clientVO.c_User_Id}"/></td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr align="center">
													<td colspan="6">검색한 고객이 존재하지 않습니다.</td>
												</tr>
											</c:otherwise>
										</c:choose>
							 						 	
										
									</tbody>
							</table>
							<div class="align-right">
								<input type="button"  value="고객 등록" id="insertBt" class="clientBtn crmButton button-margin-top">
								<input type="hidden" id="c_Client_No" name="c_Client_No">
							</div>
							<div style="display: block; text-align: center;" id="boardPage">		
								<c:if test="${paging.startPage != 1 }">
									<a href="/client/clientList.crm?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
								</c:if>
								<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
									<c:choose>
										<c:when test="${p == paging.nowPage }">
											<b>${p }</b>
										</c:when>
										<c:when test="${p != paging.nowPage }">
											<a href="/client/clientList.crm?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p}</a>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:if test="${paging.endPage != paging.lastPage}">
									<a href="/client/clientList.crm?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
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