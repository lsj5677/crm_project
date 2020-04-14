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
		<title>자료실 글쓰기</title>
		<link rel="stylesheet" href="/resource/css/common/reset.css">
		<link rel="stylesheet" href="/resource/css/common/common.css">
		<link rel="stylesheet" href="/resource/css/common/sub_common.css">
		<link rel="stylesheet" href="/resource/css/board/boardInsert.css">
		<link rel="stylesheet" href="/resource/css/common/responsive.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		<script src='https://kit.fontawesome.com/a076d05399.js'></script>		
		<script type="text/javascript" src="/resource/js/common/common.js"></script>
		<script type="text/javascript" src="/resource/js/common/responsive.js"></script>
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
	<div class="wrap">
		<!--header-->
		<header class="header"> <%@include
			file="../common/header.jsp"%> </header>
		<!-- //header -->

		<!-- sidebar -->
		<aside class="sidebar"> <%@include
			file="../common/sidebar.jsp"%> </aside>
		<!-- //sidebar -->



		<div class="container">
			<!--board-wrap-->
			<div class="wrap board-wrap">
				<!--title-->
				<div class="title">
					<h3>Board Write</h3>
					<p>자료실 글쓰기</p>
				</div>

				<div class="subWrap">
					<div class="contents">
		
		<form  id="form" name="form" encType="application/x-www-form-urlencoded" method="post">
			<table border="2" align="center" id="boardWrite">
				<tr>
					<td>번호</td><td><input type="text" name="c_materials_no" id="c_materials_no" size="20"  value="<%=c_materials_no%>" readonly></td>
				</tr>
				<tr>
					<td>제목</td><td><input type="text" name="c_materials_title" id="c_materials_title" placeholder="제목을 입력하세요."></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="c_materials_name" id="c_materials_name" size="40" placeholder="작성자를 입력하세요." ></td>
		
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
					<td>비밀번호</td>
					<td><input type="password" name="c_materials_pw" id="c_materials_pw" size="30" placeholder="비밀번호를 입력하세요."></td>
					    
				</tr>
				<tr>
					<td colspan="2" align="right" class="align-right">
						<input type="button" value="저장" name="insert" id="insert" class="crmButton">
						<input type="button" value="목록" name="board" id="board" class="crmButton">
					</td>
				</tr>
		
			</table>
		</form>
		
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