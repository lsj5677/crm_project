<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-wodth, intial-scale=1.0, maximum-scale=1.0,
minimum-scale=1.0, user-scalable=no"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>comment</title>
<link rel="stylesheet" href="/resource/css/common/reset.css">
<link rel="stylesheet" href="/resource/css/common/common.css">
<link rel="stylesheet" href="/resource/css/common/sub_common.css">
<link rel="stylesheet" href="/resource/css/board/boardInsert.css">
<link rel="stylesheet" href="/resource/css/common/responsive.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/include/js/common.js"></script>
<script type="text/javascript">
	
	$(function(){
		var c_board_no="<c:out value='${detail.c_board_no}'/>";
		listAll(c_board_no)
		//덧글 내용 저장 이벤트
		$("#replyInsert").click(function(){
			if(!chkSubmit($("#c_comment_name"),"이름을")) return;
			else if(!chkSubmit($("#c_comment_content"),"내용을")) return;
			else{
				var insertUrl = "/replies/replyInsert.crm";
				$.ajax({
					url : insertUrl,
					type : "post",
					headers : {
						"Content-Type":"application/json",
						"X-HTTP-Method-Override":"POST"
					},
					dataType:"text",
					data : JSON.stringify({
						c_board_no:c_board_no,
						c_comment_name:$("#c_comment_name").val(),
						c_comment_pw:$("#c_comment_pw").val(),
						c_comment_content:$("#c_comment_content").val()
						
						
					}),
					error : function(){
						alert('시스템 오류 입니다 관리자에게 문의 하세요');
					},
					success : function(resultData){
						if(resultData=="SUCCESS"){
							alert("댓글 등록이 완료되었습니다.");
					dataReset();
					listAll(c_board_no);
					
						}
						
						
					}
				
			});
			
			
		}
		
	});

//수정 버튼 클릭시 수정 
	$(document).on("click",".update_form",function(){
		$(".reset_btn").click();
		var conText = $(this).parents("li").children().eq(1).html();
		console.log("conText:" + conText);
		$(this).parents("li").find("input[type='button']").hide();
		$(this).parents("li").children().eq(0).html();
		var conArea = $(this).parents("li").children().eq(1);
		conArea.html("");
		
		var data ="<textarea name='content'id='content'>" +conText+ "</textarea>";
		data +="<input type ='button' class='update_btn crmButton reply_update_button' value='수정완료'>";
		data +="<input type ='button' class='reset_btn crmButton reply_update_button' value='수정취소'>";
		conArea.html(data);
		
	});
	
// 초기화 버튼 
	$(document).on("click",".reset_btn",function(){
	var conText = $(this).parents("li").find("textarea").html();
	$(this).parents("li").find("input[type='button']").show();
	var conArea = $(this).parents("li").children().eq(1);
	conArea.html(conText);
	
	});
// 글수정 위한 Ajax 연동 처리
	$(document).on("click",".update_btn",function() {
	var c_comment_no = $(this).parents("li").attr("data-num");
	alert(c_comment_no);
	var c_comment_content = $("#content").val();
	alert(c_comment_content);
	if(!chkSubmit($("#content"),"댓글 내용을 ")) return;
	else{
			$.ajax({
				url:'/replies/'+c_comment_no+".crm",
				type:'PUT',
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"PUT"},
				dataType:'text',
				data:JSON.stringify({c_comment_content:c_comment_content}),
				success:function(result){
					console.log("result:"+result);
					if(result =="SUCCESS"){
						alert("수정 완료되었습니다.");
				listAll(c_board_no);
				
					}
					
					
				},error : function(e){
					console.log(e);
					alert(e);
					alert("error");
				}
			
		});
		
		
	}
	
});
//글 삭제 를 위한 Ajax 연동 처리
$(document).on("click",".delete_btn",function(){
	var c_comment_no = $(this).parents("li").attr("data-num");
	console.log("c_comment_no"+c_comment_no);
	if(confirm("선택하신 댓글을 삭제하시겠습니까?")){
		$.ajax({
			type :'delete',
			url :'/replies/'+c_comment_no+".crm",
			headers : {
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"DELETE"
				},
			dataType:"text",
			success : function(result){
				console.log("result:"+result);
				if(result =="SUCCESS"){
					alert("삭제가 완료되었습니다.");
			listAll(c_board_no);
			
				}
				
				
			}
		
			});
		}

		});
	});
	
// 리스트 요청 함수	
function listAll(c_board_no){
	$("#comment_list").html("");
	var url ="/replies/all/"+c_board_no+".crm";
	$.getJSON(url,function(data){
	console.log("데이터 >>: "+data.length);
	$(data).each(function(){
		var c_comment_no = this.c_comment_no;
		var c_comment_name = this.c_comment_name;
		var c_comment_content = this.c_comment_content;
		var c_comment_insertdate = this.c_comment_insertdate;
		addNewltem(c_comment_no, c_comment_name ,c_comment_content, c_comment_insertdate);
	
	});
	}).fail(function(){
		alert("댓글 목록 불러오는데 실패 잠시후 다시 시도해주세요");
	
	});
	
}
//새로운 글을 화면에 추가 하기 위한 함수
function addNewltem(c_comment_no,c_comment_name,c_comment_content, c_comment_insertdate){
	//새로운 글이 추가될 li태그 객체
	var new_li = $("<li>");
	new_li.attr("data-num",c_comment_no);
	new_li.addClass("comment_item");
	
	//작성자 정보가 지정될 <p> 태그
	var writer_p = $("<p>");
	writer_p.addClass("writer");

	//작성자 정보의 이름
	var name_span = $("<span>");
	name_span.addClass("name");
	name_span.html(c_comment_name + "님");
	console.log(c_comment_name +"zzz");
	//작성 일시
	var date_span = $("<span>");	
	date_span.html("/"+ c_comment_insertdate+"");
	
	// 수정하기 버튼
	var up_input = $("<input>");
	up_input.attr({"type":"button","value":"수정하기"});
	up_input.addClass("update_form");
	up_input.addClass("crmButton");
	up_input.addClass("replyButton");
	
	// 삭제하기 버튼
	var del_input = $("<input>");
	del_input.attr({"type":"button","value":"삭제하기"});
	del_input.addClass("delete_btn");
	del_input.addClass("crmButton");
	del_input.addClass("replyButton");
	
	// 내용
	var content_p = $("<p>");
	content_p.addClass("con");
	content_p.html(c_comment_content);
	
	//조립하기
	writer_p.append(name_span).append(date_span).append(up_input).append(del_input)
	new_li.append(writer_p).append(content_p);
	$("#comment_list").append(new_li);

	}
	//input 태그 대한 초기화
	function dataReset(){
		$("#c_comment_name").val("");
		$("#c_comment_pw").val("");
		$("#c_comment_content").val("");
				
	}

	
</script>
</head>
<body>
	<div id="replyContainer">

		<div id="comment_write" class="board-wrap">
			<form id="comment_form">
				<div>

					<label for="c_comment_name">작성자</label> 
					<input type="text" name="c_comment_name" id="c_comment_name" />
					
					<label for="c_comment_name">비밀번호</label> 
					<input type="password" name="c_comment_pw" id="c_comment_pw" /> 
			
					<label for="c_comment_content" class="comment">댓글 내용</label>
					<textarea name="c_comment_content" id="c_comment_content"></textarea>
					
					<input type="button" id="replyInsert" value="댓글쓰기" class="crmButton"/>

				</div>
			</form>
		</div>
		<ul id="comment_list">
			<!-- 여기에 동적 생성 요소가 들어가게됩니다. -->
		</ul>
	</div>

</body>
</html>