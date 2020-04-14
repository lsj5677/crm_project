<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 상세 보기</title>
<link rel="stylesheet" type="text/css" href="/include/css/board.css"/>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/include/js/common.js"></script>
<script type="text/javascript">
	
	var butChk =0; // 수정 버튼과 삭제 버튼을 구별하기 위한 변수
	
	$(function(){
		$("#pwdChk").hide();
		/* 첨부파일 이미지 보여주기 위한 속성 추가*/
	var file = "<c:out value='${detail.c_board_img}'/>";		
		if(file!=""){
			$("#fileImage").attr({
				src:"/uploadStorage/${detail.c_board_img}",
				width:"450px",
				height:"200px"
				
			});
	}
		/*수정 버튼 클릭시 처리 이벤트*/
	$("#updateForm").click(function(){
		$("#pwdChk").show();
		$("#msg").text("작성시 입력한 비밀번호를 입력해 주세요.")
									.css("color","#000099");
		
		butChk = 1;
	
		
	});
	/*삭제 버튼 클릭시 처리 이벤트*/
	$("#boardDelete").click(function(){
		$("#pwdChk").show();
		$("#msg").text("작성시 입력한 비밀번호를 입력해 주세요.")
									.css("color","#000099");
		
		butChk = 2	
		
	});	
		
	/*비밀번호 확인 버튼 클릭시 처리 이벤트*/
	$("#pwdBut").click(function(){
		pwdConfirm();
			
	});
	
	/*목록 버튼 클릭시 처리 이벤트*/
	$("#boardList").click(function(){
		location.href="/board/boardList.crm";
		
		
	});	
		
	});
	
	/*비밀번호 확인 버튼 클릭시 실질적인 처리 함수*/
	
	function pwdConfirm(){
		if(!chkSubmit($('#c_board_pw'),"비밀번호를")) return;
			else{
			$.ajax({
				url : "/board/pwdConfirm.crm", 
				type : "POST",
				data : $("#f_pwd").serialize(),
				error : function(){
					alert('시스템 오류 입니다. 관리자에게 문의하세요');
					
				},
			success : function(resultData){
				var goUrl="";
				if(resultData==0){
					$("#msg").text("작성시 입력한 비밀번호가 일치 하지 않습니다.").css("color","red");
					$("#c_board_pw").select();
					
				}else if(resultData==1){
					$("msg").text("");
					alert(">>>>>>>>>>>>>>>>>");
					if(butChk==1){
						goUrl = "/board/updateForm.crm";
						
					}else if(butChk==2){
						goUrl = "/board/boardDelete.crm";
						
					}
					$("#f_data").attr("action",goUrl);
					$("#f_data").submit();
				}
								
			}
					
			});
						
		}
		
	}

	
</script>
</head>
<body>
	<div id="boardTit"><h3>글상세</h3></div>
	<form name = "f_data" id="f_data" method="POST">
	<input type="hidden" name ="c_board_no" value="${detail.c_board_no}"/>
	<input type="hidden" name ="c_board_img" id="c_board_img" value="${detail.c_board_img}"/>
	</form>
	<%--====================== 비밀번호 확인 버튼 및 버튼 추가 시작  -===-=-=-=-=---%>
	
	<%-- ====================== 비밀번호 확인 버튼 및 추가 종료================ --%>
		<%-- ====================== 상세 보여 주기 시작================ --%>
		
<div id ="boardDeail">
	<table>
	<colgroup>
	
		<col width="25%"/>
		<col width="25%"/>
		<col width="25%"/>
		<col width="25%"/>
	
	
	
	</colgroup>
	<tbody>
	<tr>
		<td class="ac"> 작성자 </td>
		<td>${detail.c_board_name}</td>	
		<td class="ac"> 작성일</td>
		<td>${detail.c_board_insertdate}</td>
		
	</tr>
	<tr>
		<td class="ac">제목</td>
		<td colspan="3">${detail.c_board_title}</td>
		</tr>
		<tr>
		<td class="ac">선택</td>
		<td colspan="3">${detail.c_board_select}</td>
		</tr>
		<tr class="ctr">
		<td class="ac">내용</td>
		<td colspan="3">${detail.c_board_content}</td>
		
			<tr class="ctr">
		<td class="ac">첨부파일 파일</td>
		<td colspan="3"><img id="fileImage"/></td>
		</tr>
		
	</tbody>

	</table>

</div>
<table id="boardPwdBut">
	<tr>
	<td id="btd1">
	<div id ="pwdChk">
		<form name = "f_pwd" id="f_pwd">
		<input type="hidden" name ="c_board_no"
			id="b_num" value="${detail.c_board_no}"/>
			<label for="c_board_pw" id="I_pwd">비밀번호 : </label>
			<input type="password" name="c_board_pw" id="c_board_pw"/>
			<input type="button" id="pwdBut" value="확인" />
			<span id ="msg"></span>
		</form>
	</div>
	</td>
	<td id ="btd2">
					<input type="button" id="updateForm" value="수정" />
				<input type="button" id="boardDelete" value="삭제" />
				<input type="button" id="boardList" value="목록" />
	
	</td>
	
	</tr>

	</table>
<!-- 상세 보여 주기 종료  -->

<jsp:include page="reply.jsp"></jsp:include>					
</body>
</html>