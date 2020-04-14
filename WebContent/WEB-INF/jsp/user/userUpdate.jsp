<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>User Update</title>	
		<link rel="stylesheet" href="/resource/css/common/reset.css">
		<link rel="stylesheet" href="/resource/css/common/common.css">
		<link rel="stylesheet" href="/resource/css/common/sub_common.css">
		<link rel="stylesheet" href="/resource/css/board/boardInsert.css">
		<link rel="stylesheet" href="/resource/css/common/responsive.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.4.0.js"></script>
		<script src='https://kit.fontawesome.com/a076d05399.js'></script>
		<script type="text/javascript" src="/resource/js/common/common.js"></script>
		<script type="text/javascript" src="/resource/js/common/responsive.js"></script>
		<script type="text/javascript" src="/resource/js/common/jquery.xdomainajax.js"></script>
		<script src='https://kit.fontawesome.com/a076d05399.js'></script>	
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		
		<script src="/resource/js/user/user.js"></script>
		
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
					<h3>User Update</h3>
					<p>사원정보수정</p>
				</div>	
				
				<div class="subWrap">
					<div class="contents">
						<form name="userUpdateForm" id="userUpdateForm" method="POST" enctype="application/x-www-form-urlencoded">
							<table border="2" align="center" class="insertForm">	
								<tr>
									<td>직급</td>
									<td class="select-box">
										<select id="c_User_Level" name="c_User_Level">
											<option value="0">관리자</option>
											<option value="1">매니저</option>
											<option value="2">사원</option>
											<option value="3">고객</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>이름</td>
									<td><input type="text" name="c_User_Name" id="c_User_Name" size="30" maxlength="16" value="<c:out value='${userVO.c_User_Name}'/>"></td>
								</tr>
								<tr>
									<td>부서</td>
									<td><input type="text" name="c_User_Department" id="c_User_Department" size="30" maxlength="16" value="<c:out value='${userVO.c_User_Department}'/>"></td>
								</tr>
								<tr>
									<td>아이디</td>
									<td>
										<input type="text" name="c_User_Id" id="c_User_Id" size="30" maxlength="16" value="<c:out value='${userVO.c_User_Id}'/>" readonly>
		
									</td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td>
										<input type="password" name="c_User_Pw" id="c_User_Pw"	size="30" maxlength="16" value="<c:out value='${userVO.c_User_Pw}'/>">
									</td>
									<tr>
										<td>비밀번호 확인</td>
										<td>
											<input type="password" name="c_User_Pw2" id="c_User_Pw2" size="30" maxlength="16" value="<c:out value='${userVO.c_User_Pw}'/>">
											<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
											<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>			    
										</td>
									</tr>
									<tr>
										<td>전화번호</td>
										<td><input type="text" name="c_User_Hp" id="c_User_Hp" size="30" maxlength="11" value="<c:out value='${userVOc_User_Hp}'/>"></td>
									</tr>
									<tr>
										<td>생년월일</td>
										<td><input type="text" name="c_User_Birth" id="c_User_Birth" size="30" maxlength="6" placeholder="6자 입력해주세요." value="<c:out value='${userVO.c_User_Birth}'/>"></td>
									</tr>
									<tr>
										<td>이메일</td>
										<td>
											<input type="email" name="c_User_Email" id="c_User_Email" size="30" maxlength="40" value="<c:out value='${duserVOc_User_Email}'/>" required>       
										</td>           
									</tr>
									<tr>
										<td>주소</td>
										<td>
											<input type="text" name="c_User_Addr" id="c_User_Addr" placeholder="우편번호" value="<c:out value='${userVO.c_User_Addr}'/>">
											<input type="button" id="addrButton" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="crmButton insertForm-button"><br>
											<input type="text" name="c_User_Addr2" id="c_User_Addr2" placeholder="도로명주소" value="<c:out value='${userVO.c_User_Addr2}'/>">
											<input type="text" name="c_User_Addr3" id="c_User_Addr3" placeholder="상세주소" value="<c:out value='${userVO.c_User_Addr3}'/>">
											<span id="guide" style="color:#999"></span>
										</td>
									</tr>
									<tr>
										<td colspan="2" align="right" class="align-right">
											<input type="button" value="사원 수정" id="userUpdate" class="crmButton">
											<input type="button" value="로그인 화면" id="userMain" class="crmButton">												
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