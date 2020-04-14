<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
    <%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글수정 화면</title>
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
<script type="text/javascript" src="/resource/js/common/jquery.xdomainajax.js"></script>
<script type="text/javascript" src="/SE2/js/service/HuskyEZCreator.js" charset="UTF-8"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script type="text/javascript" src="/include/js/common.js"></script>
<script type="text/javascript">
$(function(){
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "c_board_content", //textarea에서 지정한 id와 일치해야 합니다.
	sSkinURI: "/SE2/SmartEditor2Skin_ko_KR.html",
	fCreator: "createSEditor2"
});
	/* 수정 버튼 클릭시 처리 이벤트 */
	$("#boardUpdate").click(function(){
		
		oEditors.getById["c_board_content"].exec("UPDATE_CONTENTS_FIELD", []);
		 try {
		     elClickedObj.form.submit();
		 } catch(e) {}
		
		//입력값 체크
		if(!chkSubmit($('#c_board_name'),"이름을")) return;
		else if(!chkSubmit($('#c_board_title'),"제목을")) return;
		else if(!chkSubmit($('#c_board_content'),"작성할 내용을")) return;
		else{
			if($('#file').val().indexOf(".")>-1){
			var ext = $('#file').val().split('.').pop().toLowerCase();
			if(jQuery.inArray(ext,['gif','png','jpg','jpeg'])==-1){
				alert('gif,png,jpg,jpeg 파일 만 업로드 할수 있습니다.');
				return;
			}
				
			}
			// console.log("기본 파일명 : "+ $('#b_file').val());
			$("#f_writeForm").attr({
				"method":"POST",
				"action":"/board/boardUpdate.crm"
				
			});
			$("#f_writeForm").submit();
		
		}
		
	});
	/*목록 버튼 클릭시 이벤트*/
	$("#boardList").click(function(){
		location.href="/board/boardList.crm";
		
		
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
					<h3>Update</h3>
					<p>게시판 글수정</p>
				</div>

				<div class="subWrap">
					<div class="contents">
 <form id="f_writeForm" name="f_writeForm" enctype="multipart/form-data">
 <input type="hidden" id="c_board_no" name="c_board_no" value="${updateData.c_board_no}"/>
 <input type="hidden" id="c_board_img" name="c_board_img" value="${updateData.c_board_img}"/>
 <table id ="boardWrite">
 	<tr>
 		<td>작성자</td>
 		<td><input type="text" name="c_board_name" id="c_board_name"
 		 value="${updateData.c_board_name}"/></td>
 		</tr>
 	<tr>
 		<td>글제목</td>
 		<td><input type="text" name="c_board_title" id="c_board_title"
 		 value="${updateData.c_board_title}"/></td>
 		</tr>
 	<tr>
 		<td>내용</td>
 		<td height="200"><textarea name ="c_board_content" id="c_board_content"
 		rows="10" cols="70">${updateData.c_board_content}</textarea></td>
 		</tr>
 	<tr>
 		<td>첨부파일</td>
 		<td><input type="file" name="file" id="file"></td>
 		</tr>
 	<tr>
 		<td>비밀번호</td>
 		<td><input type="password" name="c_board_pw" id="c_board_pw"/>
 		<label>수정할 비밀번호를 입력해주세요</label></td>
 		
 		</tr>
 
 </table>

 </form>
 <div id="boardBut" class="align-right button-margin-top">
 	<input type="button" value="수정" class="but crmButton" id ="boardUpdate"/>
 	<input type="button" value="목록" class="but crmButton" id ="boardList" />
 </div>
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