<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
<%@ page import="com.crm.vo.ProductVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src='https://kit.fontawesome.com/a076d05399.js'></script>
		<!-- <script src="/resource/js/dashboard/weather.js"></script> -->		
		<script type="text/javascript" src="/resource/js/common/common.js"></script>
		<script type="text/javascript" src="/resource/js/common/responsive.js"></script>
		<script type="text/javascript" src="/resource/js/common/jquery.xdomainajax.js"></script>
		<script src='https://kit.fontawesome.com/a076d05399.js'></script>	
		<script>
			$(function(){
				$('.holdBtn').click(function(){
					alert("Hold >>> ");
					
					var c_id = $(this).parents("dd").children("ul").children("li").children().eq(0).val();
					var c_name = $(this).parents("dd").children("ul").children("li").children().eq(1).val();
					
					var insertUrl = "/shopping/shoppingInsert.crm"
					
					$.ajax({
						url : insertUrl,
						type : "post",
						data : {
							c_id : c_id,
							c_name : c_name
						},
						error : function(){
							alert("Error >>> ");
						},
						success : function(data){
							
							var bool = eval(data);
							if(bool){
								alert("hold success >>> ");
								if(confirm("hold page >>>")){
									location.href="/shopping/shoppingList.crm";
								}
							}else {
								alert("hold Error >>> ")
							}
						}
					});// end of ajax
				});// end of c_name click function
			});// end of jquery function
		</script>
	</head>
	<body>
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
					<%
					Object list = request.getAttribute("list");
					System.out.println("list >>> " + list);
					
					if(list!=null){
						List<ProductVO> pList = (ArrayList)list;
						if(pList.size() == 0){
					
					%>
			      <!--no data table-->
			      <h2>No data</h2>
			      <!--//no data table-->
					<%
						} else {
					%>
			      <!--data table-->
			      <!--product-list-wrap-->
					<div id="product-list-wrap">
						<%
							for (int i = 0; i<pList.size(); i++){
								ProductVO pvo = (ProductVO) pList.get(i);
						%>
						<!--product-list-wrap dl-->
						<dl>
							<!--product-list-wrap dt-->
							<dt>
								<div class="product-image">
									<%-- <img src="./upload/<%=pvo.getc_image()%>" border=0 alt="" /> --%>
								</div>
							</dt>
							<!--//product-list-wrap dt-->
							
							<!--product-list-wrap dd-->
							<dd>
								<!--product-list-wrap dd ul-->
							<%-- 	<ul>
									<li>
										<input type="text" class="readonlyBtn" value="<%=pvo.getc_id() %>" name="c_name" id="c_name" readonly />
									</li>
									<li><input type="text" class="readonlyBtn" value="<%=pvo.getc_name() %>" name="c_id" id="c_id" readonly /></li>
									<li><%=pvo.getc_price() %></li>
									<li><%=pvo.getc_info() %></li>
								</ul>	 --%>
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
						
						<%
									} // end of for
								}// end of sList.size if
							}// end of if
						%>
						</div>
					  <!--//product-list-wrap-->
				      
				      <!--//data table-->
				   </form>
					<!--//shoppingList-->	
				</div>
			</div>	
		</div>
	</body>
</html>