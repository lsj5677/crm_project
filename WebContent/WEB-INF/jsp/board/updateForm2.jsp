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
<link rel="stylesheet" type="text/css" href="/include/css/board.css"/>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/include/js/common.js"></script>
<script type="text/javascript">
$(function(){
	/* 수정 버튼 클릭시 처리 이벤트 */
	$("#boardUpdate").click(function(){
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
 <div id="boardTit"><h3>글수정</h3></div>
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
 <div id="boardBut">
 	<input type="button" value="수정" class="but" id ="boardUpdate"/>
 	<input type="button" value="목록" class="but" id ="boardList" />
 </div>
</body>
</html>