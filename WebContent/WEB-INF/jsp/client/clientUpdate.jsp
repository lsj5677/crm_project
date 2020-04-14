<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="com.crm.vo.ClientVO"%>
<%	
	request.setCharacterEncoding("UTF-8"); 
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Client Update</title>	
		<link rel="stylesheet" href="/resource/css/common/reset.css">
		<link rel="stylesheet" href="/resource/css/common/common.css">
		<link rel="stylesheet" href="/resource/css/common/sub_common.css">
		<link rel="stylesheet" href="/resource/css/board/boardInsert.css">
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
		<script type="text/javascript" src ="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script type="text/javascript" src="/resource/tk/js/common/chkSubmit.js"  charset='UTF-8'></script>
		
		<script src="/resource/js/client/clientUpdate.js"></script>
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
				<div class="wrap board-wrap">	
					<!--title-->
					<div class="title">	
						<h3>Client Update</h3>
						<p>고객정보수정</p>
					</div>	
					
					<div class="subWrap">
						<div class="contents">
							<form name="clientUpdate" id="clientUpdate" method="POST" enctype="application/x-www-form-urlencoded">
							<table border="2" align="center" class="insertForm">	
			
								<tr>
									<td>이름</td>
									<td>
										<input type="text" name="c_Client_Name" id="c_Client_Name" size="30" maxlength="16" value='<c:out value="${detail.c_Client_Name}"/>'>
									</td>
								</tr>
								<tr>
									<td>전화번호</td>
									<td>
										<input type="text" name="c_Client_Hp" id="c_Client_Hp" size="30" maxlength="11" value='<c:out value="${detail.c_Client_Hp}"/>'>
									</td>
								</tr>
								<tr>
									<td>생년월일</td>
									<td><input type="text" name="c_Client_Birth" id="c_Client_Birth" size="30" maxlength="6" placeholder="6자 입력해주세요." readonly value='<c:out value="${detail.c_Client_Birth}"/>'>
									</td>
								</tr>
								<tr>
									<td>이메일</td>
									<td>
										<input type="email" name="c_Client_Email" id="c_Client_Email" size="30" maxlength="40" required value='<c:out value="${detail.c_Client_Email}"/>'>       
									</td>           
								</tr>
								<tr>
									<td>주소</td>
									<td>
										<input type="text" name="c_Client_Addr" id="c_Client_Addr" placeholder="우편번호" value='<c:out value="${detail.c_Client_Addr}"/>'>
										<input type="button" id="addrButton" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="crmButton insertForm-button"><br>
										<input type="text" name="c_Client_Addr2" id="c_Client_Addr2" placeholder="도로명주소" value='<c:out value="${detail.c_Client_Addr2}"/>'>
										<input type="text" name="c_Client_Addr3" id="c_Client_Addr3" placeholder="상세주소" value='<c:out value="${detail.c_Client_Addr3}"/>'>
										<!--  <input type="text" id="sample4_jibunAddress" placeholder="지번주소">-->
										<span id="guide" style="color:#999"></span>
									</td>
								</tr>
								<tr>
									<td>담당 직원</td>
									<td>
										<input type="text" id="c_User_Id" name="c_User_Id" value='<c:out value="${detail.c_User_Id}"/>'>
										<input type="button" value="직원 확인" id="userCheck" name="userCheck" class="crmButton">
									</td>
								</tr>
								<tr>
									<td colspan="2" align="right" class="align-right">
										<input type="button" value="고객 등록" id="clientBt" class="crmButton">
										<input type="button" value="고객 탈퇴" id="deleteBt" class="crmButton">
										<input type="hidden" id="c_Client_No" name="c_Client_No" value='<c:out value="${detail.c_Client_No}"/>'>
										<input type="button" value="고객 리스트" id="userMain" class="crmButton">							
										<input type="reset" value="다시" class="crmButton retry">
									</td>
								</tr>
			
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