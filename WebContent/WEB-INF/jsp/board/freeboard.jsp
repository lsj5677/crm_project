<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
<%
	request.setCharacterEncoding("UTF-8");
	String select = (String)request.getAttribute("select");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 목록</title>
<link rel="stylesheet" href="/resource/css/common/reset.css">
<link rel="stylesheet" href="/resource/css/common/common.css">
<link rel="stylesheet" href="/resource/css/common/sub_common.css">
<link rel="stylesheet" href="/resource/css/board/boardList.css">
<link rel="stylesheet" href="/resource/css/common/responsive.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>		
<script type="text/javascript" src="/resource/js/common/common.js"></script>
<script type="text/javascript" src="/resource/js/common/responsive.js"></script>
<script type="text/javascript" src="/resource/js/common/jquery.xdomainajax.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>	
<script type="text/javascript" src="/include/js/common.js"></script>
<script type="text/javascript">
	
	$(function(){
		/*검색 후 검색 대상과 검색단어 출력*/
			$("#c_board_select").val("<%=select%>");
		if("<c:out value='${data.keyword}'/>"!=""){
			$("#keyword").val("<c:out value='${data.keyword}'/>");
			$("#search").val("<c:out value='${data.search}'/>");

		}
			//한페이지에 보여줄 레코드 수 조회후 선택한 값 그대로 유지하기 위한 설정
		if("<c:out value='${data.pageSize}'/>"!=""){
			$("#pageSize").val("<c:out value='${data.pageSize}'/>");
			
		}	
			//검색 대상이 변경될 때마다 처리 이벤트
		$("#search").change(function(){
			if($("#search").val()=="all"){
				$("#keyword").val("전체 데이터를 조회합니다.");
			}else if($("#search").val()!="all"){
				$("#keyword").val("");
				$("#keyword").focus();
			}
			
		});
		/*검색 버튼 클릭 시 처리 이벤트*/
		$("#searchData").click(function(){
			if($("#search").val()!="all"){
				if(!chkSubmit($('#keyword'),"검색어를")) return; 	
			}
			goPage(1);
		});
		//한페이지에 보여줄 레코드 수 변경 될 때마다 처리 이벤트

		$("#pageSize").change(function(){
			goPage(1);	
		});
		
		
		/*글쓰기 버튼 클릭시 처리 이벤트*/
		$("#writeForm").click(function(){
			location.href="/board/writeForm.crm";
			
			
		});
		
		/* 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트*/
		$(document).on("click",".goDetail",function(){
			var c_board_no = $(this).parents("tr").attr("data-num");
			//글 상세 페이지로 이동
		
				$('#c_board_no').val(c_board_no);
				$("#a").val("");
			goDetail();
		});
		$(".goReply").click(function(){
			var c_board_no = $(this).parents("tr").attr("data-num");
			//글 상세 페이지로 이동
		
				$('#c_board_no').val(c_board_no);
			window.open("","pop","width=800,height=400");
			$("#a").val("a");
			$("#detailForm").attr({
				"method":"get",
				"action":"/board/boardDetail.crm",
				"target":"pop"
			});
			$("#detailForm").submit();
			
			
		});
	});
	function goDetail(){
		
		$("#detailForm").attr({
			"method":"get",
			"action":"/board/boardDetail.crm"
		});
		
		$("#detailForm").submit();
	}

	
	/*정렬 버튼 클릭시 처리 함수*/
	function setOrder(order_by){
	$("#order_by").val(order_by);
	if($("#order_sc").val()=='DESC'){
	$("#order_sc").val('ASC');
	
	}else{
		$("#order_sc").val('DESC');
		
	}
		goPage(1);
	}
	/*검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실질적인 처리 함수*/

	function goPage(page){
	if($("#search").val()=="all"){
	$("#keyword").val("");
		
	}
	$("#page").val(page);
	$("#f_search").attr({
		"method":"get",
		"action":"/board/boardList.crm"
	
	});
	$("#c_board_select").val("자유게시판");
		$("#f_search").submit();
	}
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

			<div class="wrap board-wrap">
				<!--title-->
				<div class="title">
					<h3>Freeboard</h3>
					<p>자유게시판</p>
				</div>

				<div class="subWrap">
					<div class="contents">

						<div id="boardContainer">
							<!-- 상세페이지 로 이동을 위한 form -->
							<form name="detailForm" id="detailForm">
								<input type="hidden" name="c_board_no" id="c_board_no">
								<input type="hidden" name="page" value="${data.page}"> <input
									type="hidden" name="pageSize" value="${data.pageSize}">
								<input type="hidden" name="a" id="a">
							</form>
							<div id="boardSearch">
								<form id="f_search" name="f_search">
									<input type="hidden" id="c_board_select" name="c_board_select">
									<input type="hidden" id="page" name="page" value="${data.page}" />
									<input type="hidden" id="order_by" name="order_by"
										value="${data.order_by}" /> <input type="hidden" id="order_sc"
										name="order_sc" value="${data.order_sc}" />

									<div class="search-select-box select-box">
										<select id="search" name="search">
											<option value="all">전체</option>
											<option value="c_board_title">제목</option>
											<option value="c_board_content">내용</option>
											<option value="c_board_name">작성자</option>
										</select> <input type="text" name="keyword" id="keyword"
											placeholder="검색어를 입력하세요" /> <input type="button" value="검색"
											id="searchData" class="crmButton" />
									</div>

									<div class="page-select-box select-box align-right">
										<select id="pageSize" name="pageSize">
											<option value="10">10줄</option>
											<option value="20">20줄</option>
											<option value="30">30줄</option>
											<!--<option value ="50">50줄</option>
											<option value ="70">70줄</option>
											<option value ="100">100줄</option> -->
										</select>
									</div>
								</form>
							</div>
							<%--검색 기능 시작 추가
	<div id="boardSearch">
	<form id="f_search" name="f_search">
	<input type="hidden" id="page" name="page" value="${data.page}"/>
	<input type="hidden" id="order_by" name="order_by" value="${data.order_by}"/>
	<input type="hidden" id="order_sc" name="order_sc" value="${data.order_sc}"/>
	<input type="hidden" id="c_board_select" name="c_board_select">
	<table summary="검색">
	
	<colgroup>
		<col width="60%"></col>
		<col width="50%"></col>
		</colgroup>
	<tr>
		<td id="btd1">
		<td align="center">	
		<select id ="search" name="search">
		<option value="all">전체</option>
		<option value="c_board_title">제목</option>
		<option value="c_board_content">내용</option>
		<option value="c_board_name">작성자</option>
		
		</select>
	
		<input type="text" name="keyword"
		id="keyword" value="검색어를 입력하세요"/>
		<input type="button"value="검색" 
		id="searchData" />
		</td>
		<td id="btd2">
			<select id="pageSize" name="pageSize">
			<option value ="10">10줄</option>
			<option value ="20">20줄</option>
			<option value ="30">30줄</option>
			<!-- <option value ="50">50줄</option>
			<option value ="70">70줄</option>
			<option value ="100">100줄</option> -->
			</select>
			</td>
			</tr>
		
			</table>
	
	
			</form>
	
	</div> 
	<div id="boardBut">

	<input type="button" value="글쓰기" id="writeForm">--%>



							<%-- ==============리스트 시작 ================== --%>
							<div id="boardList">
								<table summary="게시판 리스트">
									<thead>
										<tr>
											<th class="res-none-mo res-none-spc">글번호</th>
											<th class="res-none-mo">게시글</th>
											<th>글제목</th>
											<th class="borcle">작성자</th>
											<th>작성일</th>
											<th class="borcle res-none-mo res-none-spc">조회수</th>
										</tr>
									</thead>
									<tbody>
										<!-- 데이터 출력 -->
										<c:choose>
											<c:when test="${not empty boardList}">
												<c:forEach var="board" items="${boardList}"
													varStatus="status">
													<tr align="center" data-num="${board.c_board_no}">

														<td class="res-none-mo res-none-spc">${board.c_board_no}</td>
														<td class="res-none-mo">${board.c_board_select}</td>
														<%-- <td>${count - (status.count-1)}</td> --%>
														<td align="left"class="boardTitle"><span class="goDetail">${board.c_board_title}</span>
															<span class="goReply" style="color: red;">[${board.c_reply_cnt}]
														</span> <c:if test="${board.c_reply_cnt > 0}">

															</c:if></td>
														<td>${board.c_board_name}</td>
														<td>${board.c_board_insertdate}</td>

														<td class="res-none-mo res-none-spc">${board.c_board_viewcount}</td>

													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="4" align="center">등록된 게시물이 존재하지 않습니다.</td>
												</tr>
											</c:otherwise>
										</c:choose>

									</tbody>

								</table>

							</div>
							<%--====================리스트 종료============ --%>
							<%--====================리스트 버튼 출력 시작=========== --%>
							<div id="boardBut" class="align-right">
								<input type="button" value="글쓰기" id="writeForm"
									class="crmButton button-margin-top">
							</div>
							<%--====================글쓰기 버튼 출력 종료============ --%>
							<%--====================페이지 네비게이션 시작============ --%>
							<div id="boardPage">
								<tag:paging page="${param.page}" total="${total}"
									list_size="${data.pageSize}" />

							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<!--footer-->
		<footer class="footer"> 
		<%@include file="../common/footer.jsp"%> </footer>
		<!-- //footer -->
	</div>
</body>
</html>