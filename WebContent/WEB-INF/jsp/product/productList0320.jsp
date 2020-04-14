<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("SP", "&nbsp;"); %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Product List</title>
		<link rel="stylesheet" href="/resource/css/common/reset.css">
		<link rel="stylesheet" href="/resource/css/common/common.css">
		<link rel="stylesheet" href="/resource/css/common/sub_common.css">
		<link rel="stylesheet" href="/resource/css/board/productList.css">
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
		
		<script src="/resource/js/product/product.js"></script>
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
					<h3>Product List</h3>
					<p>상품리스트</p>
				</div>	
				
				<div class="subWrap">
					<div class="contents">
						<!--cartList-->
						 <form id="productList" name="productList" method="POST">
							<c:choose>
								<c:when test="${not empty list}">	
					     
					      <!--data table-->
					      <!--product-list-wrap-->
							<div id="product-list-wrap">
								<%-- <c:forEach var="pList" items="${list}" class="product-list-item"> --%>
								<c:forEach var="pList" items="${list}">
								<!--product-list-wrap dl-->
								<dl>
									<!--product-list-wrap dt-->
									<dt>
										<div class="product-image">
											<img src="${pageContext.request.contextPath}/resource/img/product_Image/${pList.c_id}/${fn:split(pList.c_image,',')[0]}" style="max-width: 169px; height: 200px;" border=0 alt="" />
										</div>
									</dt>
									<!--//product-list-wrap dt-->
									
									<!--product-list-wrap dd-->
									<dd>
										<!--product-list-wrap dd ul-->
										<ul>
											<li><input type="text" class="readonlyBtn" value="<c:out value='${pList.c_id}' />" name="c_name" id="c_name" readonly /></li>
											<li><input type="text" class="readonlyBtn" value="<c:out value='${pList.c_name}' />" name="c_id" id="c_id" readonly /></li>
											<li><c:out value='${pList.c_price}'/></li>
											<%-- <li><c:out value='${pList.c_info}'/></li> --%>
										</ul>		
										<!--//product-list-wrap dd ul-->
										<!--product-list-wrap dd holdBtn-wrap-->
										<div class="holdBtn-wrap">						
											<input class="holdBtn crmButton" type="button" value="HOLD" />
										</div>
										<!--//product-list-wrap dd holdBtn-wrap-->
									</dd>
									<!--//product-list-wrap dd-->
									
								</dl>
								<!--//product-list-wrap dl-->
								</c:forEach>
							</div>
						  <!--//product-list-wrap-->
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