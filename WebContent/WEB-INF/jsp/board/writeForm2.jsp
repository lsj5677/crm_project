
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("UTF-8");
%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기 화면</title>
<script type="text/javascript" src="/SE2/js/service/HuskyEZCreator.js" charset="UTF-8"></script>



<link rel="stylesheet" type="text/css" href="/include/css/board.css"/>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
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

		/*저장 버튼 클릭시 처리 이벤트*/
		$("#boardInsert").click(function(){
			
			oEditors.getById["c_board_content"].exec("UPDATE_CONTENTS_FIELD", []);
			 try {
			     elClickedObj.form.submit();
			 } catch(e) {}
			
			
			//입력값 체크
			if(!chkSubmit($('#c_board_name'),"이름을")) return;
			else if (!chkSubmit($('#c_board_title'),"제목을"))return;
			else if (!chkSubmit($('#c_board_content'),"작성할 내용을"))return;
			else if (!chkSubmit($('#file'),"첨부파일을"))return;
			else if (!chkSubmit($('#c_board_pw'),"비밀번호를"))return;
			else if (!chkSubmit($('#c_board_select'),"게시판을 "))return;
			else{
				/*배열내의 값을 찾아서 인덱스를 반환(요소가 없을 경우 -1반환)
				jQuery.inArray(찾을 값, 검색 대상의 배열)*/
				var ext = $('#file').val().split('.').pop().toLowerCase();
				if(jQuery.inArray(ext,['gif','png','jpg','jpeg'])== -1){
				alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
		
				return;
				
					
					
				}
				$("#f_writeForm").attr({
					"method":"POST",
					"action":"/board/boardInsert.crm"	
				});
				
				$("#f_writeForm").submit();
			}
			
		});
		

			/* 목록 버튼 클릭시 처리 이벤트*/
			$("#boardList").click(function(){
				location.href="/board/boardList.crm";
				
				
			});
		});
		

</script>
</head>
<body>
	<div id="boardTit"><h3>글쓰기</h3></div>
<form id ="f_writeForm" name="f_writeForm" enctype="multipart/form-data">
	<table id="boardWrite">
	<tr>
		
			<select id="c_board_select" name="c_board_select">
				<option value="">--게시글선택--</option>
		        <option value="공지사항">공지사항</option>
		        <option value="자유게시판">자유게시판</option>
	    	</select>	
		
		<td>작성자</td>
		<td><input type="text" name="c_board_name" id="c_board_name"></td>
		</tr>
		<tr>
		<td>글제목</td>
		<td><input type="text" name="c_board_title" id="c_board_title"></td>
		</tr>
		<tr>
		<td>내용</td>
		<td height="200"> <textarea name= "c_board_content" id="c_board_content" rows="10" cols="70" style="display:none;"></textarea></td>
		</tr>
		<tr>
		<td>첨부파일</td>
		<td><input type="file" name="file" id="file"></td>
		</tr>
		
		<tr>
		<td>비밀번호</td>
		<td><input type="password" name="c_board_pw" id="c_board_pw"></td>
		</tr>
		
		
	</table>

</form>	
	<div id="boardBut">
		
		<input type="button" value="저장" class="but" id="boardInsert">
		<input type="button" value="목록" class="but" id="boardList">

	</div>
</body>
</html>