<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="user" value="${sessionScope.c_User_Id}" /> 
<!--sidebar-wrap-->
<div class="sidebar-wrap">
	<!--sidebar-logo-wrap-->
	<div class="sidebar-logo-wrap">
		<!--sidebar-logo-content-->
		<div class="sidebar-logo-content">
			<a href="/dashBoard/home.crm" title="Dashboard"> 
				<img src="/resource/img/logo.png" alt="crm logo" />
			</a>
		</div>
		<!--logo-content-->
	</div>
	<!--//logo-wrap-->
	<!--sidebar-menu-wrap-->
	<nav class="sidebar-menu-wrap">
		<!--sidebar-menu-content-->
		<div class="sidebar-menu-content">
			<ul>
				<!--sidebar-search-wrap-->
				<li class="sidebar-1depth-menu sidebar-search-wrap">
					<div>
						<div class="input-group">
							<form name="productForm" method="post">
								<input type="text" class="input-text" id="productName"name="productName" placeholder="Text Search" onkeydown="JavaScript:Enter_Check();">
							</form>
							<button class="input-button" style="right: 20px;" onclick="searchProduct()" >
								<i class="fa fa-search fa-sm"></i>
							</button>
							<!-- <button class="input-button" data-toggle="modal" data-target="#imageSearch">
								<i class="fas fa-camera fa-sm"></i>
							</button> -->
							<button class="input-button" onclick="window.open('/imageSearch/imageSearch.jsp','imageSearch','width=430,height=500,location=no,status=no,scrollbars=yes');">
								<i class="fas fa-camera fa-sm"></i>
							</button>
						</div>
					</div>
				</li>
				<!--//sidebar-search-wrap-->
				<li class="sidebar-1depth-menu">
					<a href="/dashBoard/home.crm" title="Dashboard" class="menu-on"> 
						<i class="fa fa-th-large"></i> 
						<span>Dashboard</span>
					</a>
				</li>
				<li class="sidebar-1depth-menu">
					<a href="/fullCalendar/schedule.crm" title="Calendar">
						<i class="fa fa-table"></i> 
						<span>Calendar</span>
					</a>
				</li>
				<li class="sidebar-1depth-menu">
					<a href="#" title="Chart" class="slide-toggle"> 
						<i class="fa fa-bar-chart-o"></i> 
						<span>Chart</span>
						<i class="fa fa-angle-right fa-right"></i>
					</a>
					<ul class="sidebar-2depth-menu">
						<li><a href="/tsales/tsalesList.crm" title="매출">매출</a></li>
						<li><a href="/performance/performanceMove.crm" title="실적">실적</a></li>
					</ul>
				</li>
				<li class="sidebar-1depth-menu">
					<a href="#" title="My client" class="slide-toggle">
						<i class="fa fa-user-tie"></i> 
						<span>My client</span>
						<i class="fa fa-angle-right fa-right"></i>
					</a>
					<ul class="sidebar-2depth-menu">
						<li><a href="/client/clientList.crm" title="list">List</a></li>
						<li><a href="/client/clientInsertForm.crm" title="insert">Insert</a></li>
					</ul>
				</li>
				<li class="sidebar-1depth-menu">
					<a href="/product/productList.crm" title="Product">
						<i class="fa fa-gem"></i> 
						<span>Product</span>
					</a>
				</li>
				<li class="sidebar-1depth-menu">
					<a href="/shopping/shoppingList.crm" title="Hold List">
						<i class="fa fa-shopping-cart"></i> 
						<span>Hold List</span>
					</a>
				</li>
				<li class="sidebar-1depth-menu">
					<a href="#" title="Board" class="slide-toggle">
						<i class="fa fa-laptop"></i> 
						<span>Board</span>
						<i class="fa fa-angle-right fa-right"></i>
					</a>
					<ul class="sidebar-2depth-menu">
						<li><a href="/board/boardList.crm?c_board_select=전체" title="전체게시판">전체게시판</a></li>
						<li><a href="/board/boardList.crm?c_board_select=공지사항" title="공지사항">공지사항</a></li>
						<li><a href="/board/boardList.crm?c_board_select=자유게시판" title="자유게시판">자유게시판</a></li>
						<li><a href="/materials/listBoard.crm" title="자료실">자료실</a></li>
					</ul>
				</li>
				<li class="sidebar-1depth-menu">
					<a href="/survey/surveyList.crm" title="Survey">
						<i class="fa fa-envelope-open"></i> 
						<span>Survey</span>
					</a>
				</li>
				<li class="sidebar-1depth-menu">
					<a href="#" title="My User" class="slide-toggle">
						<i class="fa fa-user"></i> 
						<span>User</span>
						<i class="fa fa-angle-right fa-right"></i>
					</a>
					<ul class="sidebar-2depth-menu">
						<li><a href="/user/userList.crm" title="list">List</a></li>
						<li><a href="/user/userInsertForm.crm" title="insert">Insert</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<!--//sidebar-menu-content-->
	</nav>
	<!--//sidebar-menu-wrap-->
</div>
<!--//sidebar-wrap-->

<script src="/resource/js/dashboard/sidebar.js"></script>
