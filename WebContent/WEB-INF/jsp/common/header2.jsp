<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="com.crm.vo.UserVO"%>
<%@page import="com.crm.common.CrmSession"%>
<%
	UserVO userVO = CrmSession.getSession(request);
	if(userVO == null){
%>
		<script type="text/javascript">
			alert("NO SESSION");
			history.go(-1);
		</script>
<%
	}
%>

<!--header-wrap-->
<div class="header-wrap">
	<!--header-sidebar-menu-icon-->
	<div class="header-sidebar-menu-icon"><i class="fa fa-bars"></i></div>
	<!--//header-sidebar-menu-icon-->
	<!--header-account-wrap-->
	<div class="header-account-wrap">
		<!--header-account-inner-->
		<ul class="header-account-inner">
			<!--account-user-notification-->
			<li class="account-user-notification dropdown-button">
				<i class="fa fa-bell"></i>
				<!--account-user-notification-dropdown-->
				<div class="account-user-notification-dropdown dropdown-wrap">
					<!--user-notification-dropdown-menu-->
					<ul class="user-notification-dropdown-menu dropdown-menu">
						<li>
							<a href="#">
								<i class="fa fa-envelope fa-sm"></i> 새 메세지가 <span>3건</span> 있습니다.
							</a>
						</li>
						<li>
							<a href="#">
								<i class="fa fa-envelope fa-sm"></i> 새 메세지가 <span>4건</span> 있습니다.
							</a>
						</li>
						<li>
							<a href="#"> 
								<i class="fa fa-envelope fa-sm"></i> 새 메세지가 <span>5건</span> 있습니다.
							</a>
						</li>
						<li class="see-all">
							<a href="#"> 
								<span>전체보기 <i class="fa fa-angle-double-right fa-sm"></i></span>
							</a>
						</li>
					</ul>
					<!--//user-notification-dropdown-menu--> 
				</div>
				<!--account-user-notification-dropdown-->
				<!--notification-badge--> 
				<span class="notification-badge">3</span>
				<!--//notification-badge--> 
			</li>
			<!--//account-user-notification-->
			<!--account-user-info-->
			<li class="account-user-info dropdown-button">
				<!--account-user-img--> 
				<span class="account-user-img">
					<img src="/resource/img/profile.jpg" alt="user image" title="user image" />
				</span> 
				<!--//account-user-img--> 
				<!--account-user-name--> 
				<span class="account-user-name"><%= userVO.getC_User_Name() %><i class='fas fa-angle-down'></i></span> 
				<!--//account-user-name--> 
				<!--account-user-name-dropdown-->
				<div class="account-user-name-dropdown dropdown-wrap">
					<!--user-name-dropdown-menu-->
					<ul class="user-name-dropdown-menu dropdown-menu">
						<li><a href="#">Mailbox</a></li>
						<li><a href="/user/userUpdateForm.crm">My page</a></li>
						<li><a href="/user/userLogout.crm">Logout</a></li>
					</ul>
					<!--//user-name-dropdown-menu-->
				</div> 
				<!--//account-user-name-dropdown-->
			</li>
			<!--//account-user-info-->
		</ul>
		<!--//header-account-inner-->
	</div>
	<!--//header-account-wrap-->
</div>
<!--//header-wrap-->
