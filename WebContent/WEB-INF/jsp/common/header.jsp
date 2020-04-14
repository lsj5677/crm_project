<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${sessionScope.c_User_Id.c_User_Id eq null}">
		<c:redirect url="/" />
</c:if>
<c:set var="user" value="${sessionScope.c_User_Id}" /> 

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
					<ul class="user-notification-dropdown-menu dropdown-menu" id="todayEvents">
					</ul>
					<!--//user-notification-dropdown-menu--> 
				</div>
				<!--account-user-notification-dropdown-->
				<!--notification-badge--> 
				<span class="notification-badge">
				</span>
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
				<span class="account-user-name"> ${user.c_User_Name} &nbsp;&nbsp; <i class='fas fa-angle-down'></i></span> 
				<!--//account-user-name--> 
				<!--account-user-name-dropdown-->
				<div class="account-user-name-dropdown dropdown-wrap">
					<!--user-name-dropdown-menu-->
					<ul class="user-name-dropdown-menu dropdown-menu">
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

<script src="/resource/js/dashboard/header.js"></script>
