<%@page import="com.crm.vo.PerformanceVO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<%	
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>zzz</title>
		<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		<link rel="stylesheet" href="/resource/css/board/userList.css">
		<link rel="stylesheet" href="/resource/css/common/reset.css">
		<link rel="stylesheet" href="/resource/css/common/common.css">
		<link rel="stylesheet" href="/resource/css/common/responsive.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap" rel="stylesheet">
		<script src='https://kit.fontawesome.com/a076d05399.js'></script>
		
		<script type="text/javascript">	
			$(document).ready(function(){
				$("#insertBt").click(function(){
					$("#performanceForm")
					.attr("action","/performance/performanceInsertForm.crm")
					.submit();
				});
								
				$(".button").click(function(){
					var key = $("#keyword").val();
					if(key == null || key == ""){
						$("#search").val("");
					}
					
					$("#performanceForm")
					.attr("action","/performance/performanceList.crm")
					.submit();
				});
				
				$("#resultBt").click(function(){
					$("#performanceForm")
					.attr("action","/performance/performanceMove.crm")
					.submit();
				});
			});
			
			function performanceMoney(sVal , sVal2, sVal3){
				alert(sVal);
				alert(sVal2);
				$("#c_User_Id").val(sVal);
				$("#c_Performance_Result").val(sVal2);
				$("#c_Performance_Insertdate").val(sVal3);
				
				if(confirm('실적 수정')){
					$("#performanceForm")
					.attr("action","/performance/performanceUpdateForm.crm")
					.submit();
				}
			}
			
			
		</script>
	</head>
	<body>
<%
	//셀렉트 올
	List<PerformanceVO> list = (List)request.getAttribute("list");
	
	
%>
		<div id="userList-wrap">
			<div id="userList-left-box">
				<h2 class="userList-title">실적</h2>
					<form name="performanceForm" id="performanceForm" method="post">
						<div class="input-btn">
							<input type="text" placeholder="고객이름을 검색하세요." id="keyword" name="keyword"> 
							<input type="hidden" id="search" name="search" value="date">
							<span class="input-group-btn">
								<button type="button" class="button">
									<i class="fa fa-search"> Search</i>
								</button>
							</span>
						</div>
						<table border="1" align="left">
						<tr align="center">
							<th>이름</th>
							<th>날짜</th>
							<th>금액</th>
						</tr>
	
<% 
	
						if(list != null){
							
							for (int i = 0; i < list.size(); i++) {
								PerformanceVO pvo = (PerformanceVO)list.get(i);
%>				
						<tbody>
							<tr align="center">
								<td>
									<a href="javaScript:performanceMoney('<%=pvo.getC_User_Id()%>', '<%=pvo.getC_Performance_Result()%>','<%=pvo.getC_Performance_Insertdate()%>')"><%=pvo.getC_User_Id()%></a>
								</td>
								<td>
									<%=pvo.getC_Performance_Insertdate()%>
								</td>
								<td>
									<script>
										var s = <%=pvo.getC_Performance_Result()%>								
										s = s.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
										document.write(s);
									</script>							
								</td>
							</tr>
<%
							}
							
						}else{
							
%>
							<tr>
								<td>
									실적이 없습니다
								</td>
							</tr>
	
	<%						
						}
	%>	
							<tr>
								<td colspan="5" align="right" class="padding-right-none">
									<input type="button"  value="실적 등록" id="insertBt">
									<input type="button"  value="그래프" id="resultBt">
									<input type="hidden" id="c_User_Id" name="c_User_Id">
									<input type="hidden" id="c_Performance_Result" name="c_Performance_Result">
									<input type="hidden" id="c_Performance_Insertdate" name="c_Performance_Insertdate">
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</body>
</html>