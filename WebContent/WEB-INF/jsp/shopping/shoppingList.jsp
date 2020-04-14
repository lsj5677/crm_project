<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.crm.vo.ShoppingVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Shopping List</title>
		<link rel="stylesheet" href="/resource/css/common/reset.css">
		<link rel="stylesheet" href="/resource/css/common/common.css">
		<link rel="stylesheet" href="/resource/css/common/sub_common.css">
		<link rel="stylesheet" href="/resource/css/board/shoppingList.css">
		<link rel="stylesheet" href="/resource/css/common/responsive.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.4.0.js"></script>
		<script src='https://kit.fontawesome.com/a076d05399.js'></script>
		<script type="text/javascript" src="/resource/js/common/common.js"></script>
		<script type="text/javascript" src="/resource/js/common/responsive.js"></script>
		<script type="text/javascript" src="/resource/js/common/jquery.xdomainajax.js"></script>
		<script src='https://kit.fontawesome.com/a076d05399.js'></script>
		
		<script src="/resource/js/shopping/shopping.js"></script>
		
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
				<h3>Hold List</h3>
				<p>상품홀드</p>
			</div>	
			
			<div class="subWrap">
				<div class="contents">
					<!--cartList-->
			   <form id="shoppingList" name="shoppingList" method="POST">
			   	<c:choose>
			   		<c:when test="${not empty list}">
			   			<table class="table"  id="shopping-list-table"> 
			   			<c:forEach var="sList" items="${list}">
			   				<tr>
								<td class="align-left">
									<input type="text" value="<c:out value='${sList.c_shopping_id}'/>" readonly class="readonlyBtn" />
								</td>
								<td class="align-left">
									<input type="text" value="<c:out value='${sList.c_id}' />" readonly class="readonlyBtn" />
									<p><c:out value="${sList.c_name}"/></p>
								</td>
								<td class="button-align-right">
									<input class="productDelete shopping-list-btn crmButton" type="button" value="Payment" />
									<input class="productUpdate shopping-list-btn crmButton" type="button" value="Delete" />
								</td>
							</tr>		   				
			   			</c:forEach>
			   			
			   			</table>
			   			<input type="hidden" id="c_shopping_id" name="c_shopping_id" />
	            		<input type="hidden" id="c_id" name="c_id" />
			   		</c:when>
			   		<c:otherwise>
			   			<!--no data table-->
					    <h2>No data</h2>
					    <!--//no data table-->
			   		</c:otherwise>
			   	</c:choose>
			      <!--//data table--> 
			   		</form>
					<!--//shoppingList-->	
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