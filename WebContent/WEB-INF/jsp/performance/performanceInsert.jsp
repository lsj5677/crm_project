<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ page import="java.util.ArrayList"%>
<%	
	request.setCharacterEncoding("utf-8"); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Insert title here</title>
		<script type="text/javascript"
				src ="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		
		<script>
	    
		$(document).ready(function(){
		
			$("#performanceBt").click(function(){
				if(!chkSubmit2($("#c_User_Id"),"아이디를")) return;
				else if(!chkSubmit2($("#c_Performance_Result"),"금액을")) return;
				
				var s = $("#c_Performance_Result").val().replace(/,/gi, '');
				s = $("#c_Performance_Result").val(s);
				alert(s);
				if($("#userCheck").val() == "OK"){
					if(confirm('등록을 진행할까요')){			
						$("#performanceInsertForm")
						.attr("action","/performance/performanceInsertOk.crm")
						.submit();
					}
				}else{
					alert("직원 확인을 해주세요");
					return;
				}
				
					
			});
			
			$("#userMain").click(function(){
				$("#performanceInsertForm")
				.attr("action","/client/clientList.crm")
				.submit();
			})
			
			$("#userCheck").click(function(){
				$.ajax({
					url : "/performance/userCheck.crm",
					type : "POST",
					data : {
						c_User_Id : $("#c_User_Id").val()
					},
					success : htkSuccess,
					error   : htkError
				});
				
				function htkSuccess(data){
					var result = data;
					var bool = eval(result);
					alert(bool);
					if(bool){
						/* alert("직원 확인"); */
						$("#c_User_Id").prop("readonly", true);
						$("#userCheck").val("OK");
					}else{
						alert("직원을 다시 확인해 주세요");
						$("#c_User_Id").val('');
						$("#c_User_Id").focus();
					}
				}
				
				function htkError(){
					alert("에이작스 실패 ");
				}
			});
			
			$("#resetCheck").click(function(){
				
				$("#userCheck").val("직원확인");
				$("#c_User_Id").prop("readonly", false);
			});
		});
		
		function commas(t) {
			// 콤마 빼고 
			var x = t.value;			
			x = x.replace(/,/gi, '');

		    // 숫자 정규식 확인
			var regexp = /^[0-9]*$/;

			if(!regexp.test(x)){ 
				$(t).val(""); 
				alert("숫자만 입력 가능합니다.");
			}else{
				x = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");			
				$(t).val(x);			
			}
		}
		
		</script>
	</head>
	<body>
	<form name="performanceInsertForm" id="performanceInsertForm" method="POST"
	      enctype="application/x-www-form-urlencoded">
		<table border="2" align="center">	
			<tr><td colspan="2" align="center">실적 등록</td></tr>
			
			<tr>
				<td>담당 직원</td>
				<td>
					<input type="text" id="c_User_Id" name="c_User_Id">
					<input type="button" value="직원 확인" id="userCheck" name="userCheck">
				</td>
			</tr>			
			<tr>
			<td>금액</td>
				<td>
					<input type="text" name="c_Performance_Result" id="c_Performance_Result" onkeyup="commas(this)" />
			 	</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="button" value="실적 등록" id="performanceBt">
					<input type="reset" value="다시" id="resetCheck">
					<input type="button" value="로그인 화면" id="userMain">
				</td>
			</tr>
			
		</table>
	</form>
	</body>
</html>