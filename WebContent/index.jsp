<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Login Page</title>
		<link rel="stylesheet" href="/resource/css/common/reset.css">
		<link rel="stylesheet" href="/resource/css/common/common.css">
		<link rel="stylesheet" href="/resource/css/common/responsive.css">
		<link rel="stylesheet" href="/resource/css/common/index.css">
	</head>
	<body>
		<c:if test="${sessionScope.c_User_Id.c_User_Id ne null}">
			<c:redirect url="/dashBoard/home.crm" />
		</c:if>
		<div class="login-wrap">
			<div>
				<h2>Login</h2>
				<!-- loginForm -->
				<form id="loginForm" action="/user/userLogin.crm" name="loginForm" method="POST">
					<!-- login-input-group-->
					<div class="login-input-group">
						<input type="text" name="c_User_Id" class="login-input-group-text" placeholder="아이디를 입력하세요" autofocus/>
						<input type
						="password" name="c_User_Pw" class="login-input-group-text" placeholder="비밀번호를 입력하세요" />
					</div>
					<!-- //login-input-group -->
					
					<!-- login-input-group -->
					<div class="login login-input-group">
						<input type="submit" value="Login" id="sendBtn">
					</div>
					<!-- //login-input-group -->
				</form>
				<!-- //loginForm -->
			</div>
		</div>
	</body>
</html>