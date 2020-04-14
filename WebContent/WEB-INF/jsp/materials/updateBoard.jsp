<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.crm.vo.MaterialsVO" %>
<%@ page import="java.util.List" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
		String c_materials_no           = "";
		String c_materials_title             = "";
		String c_materials_name              = "";
		String c_materials_memo          = "";
		String c_materials_file                  = "";
		String c_materials_pw                = "";
		String c_materials_insertdate    = "";
		String c_materials_updatedate = "";
		Object obj = request.getAttribute("list");
		System.out.println("obj >>> : "+obj);
		if(obj != null){
			List<MaterialsVO> list = (List<MaterialsVO>)obj;
			System.out.println("list >>> : "+list);
			if(list.size() > 0){
				MaterialsVO bvo           = (MaterialsVO)list.get(0);
				c_materials_no           = bvo.getC_materials_no();
				c_materials_title             = bvo.getC_materials_title();
				c_materials_name              = bvo.getC_materials_name();
				c_materials_memo          = bvo.getC_materials_memo();
				c_materials_file                  = bvo.getC_materials_file();
				c_materials_pw                = bvo.getC_materials_pw();
				c_materials_insertdate    = bvo.getC_materials_insertdate();
				c_materials_updatedate = bvo.getC_materials_updatedate();
			}else{
				System.out.println("list >>> : null");
			}
		}else{
			System.out.println("obj >>> : null");
		}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>자료실 수정</title>
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
			console.log("document.ready");
			$('#update').click(function(){
				console.log("update");
				$('#ISUD_TYPE').val('U');
				$("#form")
				.attr("action","/materials/updateBoard.crm")
				.submit();
			});
			$('#board').click(function(){
				console.log("board");
				
				$('#ISUD_TYPE').val('S');
				$("#form")
				.attr("action","/materials/selectBoard.crm")
				.removeAttr("encType")
				.submit();
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
						<form id="form" name="form" method="post"
							encType="multipart/form-data">
							<table border="1" align="center" id="boardWrite">
								<tr>
									<td>파일명</td>
									<td colspan="2"><input type="file" name="c_materials_file"
										id="c_materials_file"></td>
								</tr>
								<tr>
									<td>번호</td>
									<td><input type="text" name="c_materials_no"
										id="c_materials_no" value=<%=c_materials_no%> readonly></td>
								</tr>
								<tr>
									<td>제목</td>
									<td><input type="text" name="c_materials_title"
										id="c_materials_title" value="<%=c_materials_title %>"></td>
								</tr>
								<tr>
									<td>내용</td>
									<td><textarea name="c_materials_memo"
											id="c_materials_memo" cols="50" rows="10"><%=c_materials_memo%></textarea></td>
								</tr>
								<tr>
									<td>작성자</td>
									<td><input type="text" id="c_materials_name"
										name="c_materials_name" value="<%=c_materials_name %>"
										readonly></td>
								</tr>
								<tr>
									<td>입력일</td>
									<td><%=c_materials_insertdate %></td>
								</tr>
								<tr>
									<td>수정일</td>
									<td><%=c_materials_updatedate %></td>
								</tr>
								<tr>
									<td colspan="2" align="right" class="align-right">
									<input type="hidden" name="c_materials_pw" id="c_materials_pw" value="<%=c_materials_pw %>"> 
									<input type="hidden" name="ISUD_TYPE" id="ISUD_TYPE"> 
									<input type="button" value="수정" name="update" id="update" class="crmButton"> 
									<input type="button" value="취소" name="board" id="board" class="crmButton"></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!--footer-->
		<footer class="footer"> <%@include
			file="../common/footer.jsp"%> </footer>
		<!-- //footer -->
	</div>
</body>
</html>