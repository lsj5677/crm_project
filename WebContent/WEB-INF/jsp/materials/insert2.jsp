<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.crm.vo.MaterialsVO" %>
<%@ page import="java.util.List" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
			System.out.println("insert.jsp start");
			String chaebun = (String)request.getAttribute("list");
			
			MaterialsVO bvo = new MaterialsVO();
			bvo.setC_materials_no(chaebun);
			String c_materials_no = bvo.getC_materials_no();
			System.out.println("c_materials_no >>> : " + c_materials_no);
		%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>insert.jsp</title>
		<script type="text/javascript"
				src="https://code.jquery.com/jquery-1.11.0.min.js">
		</script>
		<script type="text/javascript">
			$(document).ready(function(){
				console.log("ready");
				$('#insert').click(function(){				
					console.log("insert");
					alert("gogogogo");
					$('#form').attr("action","/materials/insertMaterials.crm");
					$('#form').attr("encType","multipart/form-data");
					$('#form').submit();
				});
				$('#board').click(function(){
					console.log("board");
					$('#form')
					.attr("action","/materials/listBoard.crm")
					.submit();
				});
				
				$('#ajax').click(function(){
					alert("ajax.click");
					if(!$('#jId').val()){
						alert("아이디를 입력해주세요.");
						$('#jId').focus();
						return;
					}//end of if
					var dataa = $("#jId").val();
					$.ajax({
						url : "/materials/board/ajaxBoard.crm",
						type : "post",
						data : {jId : dataa},
						success : function(data){
							alert("완료!");
							var bool = $(data).find("result").text();
							console.log("bool >>> : " + bool);
							var result = eval(bool);
							console.log("result >>> : " + result);
							if (result){
								alert("가능");
								$('#jId').prop('readonly',true);
								console.log("result >>> : " + result);
							}else{
								alert("불가능");
								console.log("result >>> : " + result);
							}
						},
						error : function(){
							alert("에러발생");
						}
					});
				});
				
			});
		</script>
	</head>

	<body>
		
		<form  id="form" name="form" encType="application/x-www-form-urlencoded" method="post">
			<table border="2" align="center">
				<tr><td colspan="8" align="center">자료실 글쓰기</td></tr>
				<tr>
					<td>번호</td><td><input type="text" name="c_materials_no" id="c_materials_no" size="20"  value="<%=c_materials_no%>" readonly></td>
				</tr>
				<tr>
					<td>제목</td><td><input type="text" name="c_materials_title" id="c_materials_title" ></td>
				</tr>
				 	<tr>
					<td>파일</td>
					<td><input type="file" name="c_materials" id="c_materials_file"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="c_materials_memo" id="c_materials_memo" cols="50" rows="10" 
						 placeholder="1500bytes"></textarea>
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="c_materials_name" id="c_materials_name" size="40" ></td>
		
				</tr>
				<tr>
					<td>비번</td>
					<td><input type="password" name="c_materials_pw" id="c_materials_pw" size="30" placeholder="비번"></td>
					    
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="button" value="저장" name="insert" id="insert">
						<input type="button" value="목록" name="board" id="board">
					</td>
				</tr>
		
			</table>
		</form>
	</body>
</html>