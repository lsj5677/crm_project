<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
<%@ page import="com.crm.vo.ShoppingVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Hold List</title>
		<link rel="stylesheet" href="/resource/css/common/reset.css">
		<link rel="stylesheet" href="/resource/css/common/common.css">
		<link rel="stylesheet" href="/resource/css/common/sub_common.css">
		<link rel="stylesheet" href="/resource/css/board/shoppingList.css">
		<link rel="stylesheet" href="/resource/css/common/responsive.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src='https://kit.fontawesome.com/a076d05399.js'></script>
		<script type="text/javascript" src="/resource/js/common/common.js"></script>
		<script type="text/javascript" src="/resource/js/common/responsive.js"></script>
		<script type="text/javascript" src="/resource/js/common/jquery.xdomainajax.js"></script>
		<script src='https://kit.fontawesome.com/a076d05399.js'></script>	
	</head>
	
	<script>
		$(function(){
			$('.productDelete').click(function(){
				var c_shopping_id = $(this).parents('tr').children('td').children().eq(0).val();
				if(confirm("payment >>> ")){
					$('#c_shopping_id').val(c_shopping_id);
					$('#shoppingList').attr('action','/shopping/shoppingDelete.crm').submit();
				}
			});
			
			$('.productUpdate').click(function(){
				var c_shopping_id = $(this).parents("tr").children("td").children().eq(0).val();
				var c_id = $(this).parents("tr").children("td").children().eq(1).val();
				if(confirm("delete >>> ")){
					$('#c_shopping_id').val(c_shopping_id);
					$('#c_id').val(c_id);
					$('#shoppingList').attr('action','/shopping/shoppingUpdate.crm').submit();
				}
			});
		});// end of function
	</script>
	<body>
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
				<%
				Object list = request.getAttribute("list");
				System.out.println("list >>> " + list);
				
				if(list!=null){
					List<ShoppingVO> sList = (ArrayList)list;
					if(sList.size() == 0){
				
				%>
		      <!--no data table-->
		      <h2>No data</h2>
		      <!--//no data table-->
				<%
					} else {
				%>
		      <!--data table-->
		      <table class="table"  id="shopping-list-table"> 
		     
				<%
					for (int i = 0; i<sList.size(); i++){
						ShoppingVO svo = (ShoppingVO) sList.get(i);
				%>
			         <tr>
						<td class="align-left">
							<input type="text" value="<%=svo.getC_shopping_id() %>" readonly class="readonlyBtn" />
						</td>
						<td class="align-left">
							<input type="text" value="<%=svo.getc_id() %>" readonly class="readonlyBtn" />
							<p><%=svo.getc_name() %></p>
						</td>
						<td class="button-align-right">
						<input class="productDelete shopping-list-btn crmButton" type="button" value="Payment" />
							<input class="productUpdate shopping-list-btn crmButton" type="button" value="Delete" />
						</td>
					 </tr>
				<%
							} // end of for
						}// end of sList.size if
					}// end of if
				%>
		        
			            <input type="hidden" id="c_shopping_id" name="c_shopping_id" />
						<input type="hidden" id="c_id" name="c_id" />
		            
			    	 </table>
						<!--//data table-->
					</form>
					<!--//shoppingList-->	
				</div>
			</div>	
		</div>
	</body>
</html>