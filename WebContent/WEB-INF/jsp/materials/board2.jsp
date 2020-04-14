<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.crm.vo.MaterialsVO" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.List" %>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>글 목록</title>
	<link rel="stylesheet" type="text/css" href="/include/css/board.css"/>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="/include/js/common.js"></script>
	<script type="text/javascript">
	
	$(function(){
		/*검색 후 검색 대상과 검색단어 출력*/
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
		//글쓰기
			$(document).ready(function(){
				console.log("ready");
				$('#insert').click(function(){
					console.log("insert.click");
					$('#form')
					.attr("action","/materials/chaebunBoard2.crm")
					.submit();
				});
				//목록
				$('#select').click(function(){
					console.log("select.click");
					$('#ISUD_TYPE').val('S');
					$('#form')
					.attr("action","/materials/selectBoard.crm")
					.submit();
				});
				
				
			});
			/* 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트*/
			$(".goDetail").click(function(){
				var c_materials_no = $(this).parents("tr").attr("data-num");
				//글 상세 페이지로 이동
					alert("상세페이지");	
					alert(c_materials_no);
					$('#ISUD_TYPE').val('S');
					$('#c_materials_no').val(c_materials_no);
				$("#detailForm").attr({
					"method":"get",
					"action":"/materials/selectBoard.crm"
					
				});
				
				$("#detailForm").submit();
				
				
			});
			/*검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실질적인 처리 함수*/

			
	});
	function goPage(page){
		if($("#search").val()=="all"){
		$("#keyword").val("");
			
		}
		$("#page").val(page);
		$("#f_search").attr({
			"method":"get",
			"action":"/materials/listBoard.crm"
		
		});
			$("#f_search").submit();
		}
		</script>

	</head>
	 

	<body>
	<div id="boardContainer">
	<div id="boardTit"><h3>사내 자료실</h3></div>
	<!-- 상세페이지 로 이동을 위한 form -->
		<form name="detailForm" id="detailForm">
		<input type="hidden" name="ISUD_TYPE" id="ISUD_TYPE">
		<input type="hidden" name="c_materials_no" id="c_materials_no">
		<input type="hidden" name="page" value="${data.page}">
		<input type="hidden" name="pageSize" value="${data.pageSize}">
		</form>
		<%--검색 기능 시작 추가 --%>
			<div id="boardSearch">
	<form id="f_search" name="f_search">
	<input type="hidden" id="page" name="page" value="${data.page}"/>
	<input type="hidden" id="order_by" name="order_by" value="${data.order_by}"/>
	<input type="hidden" id="order_sc" name="order_sc" value="${data.order_sc}"/>
	<table summary="검색">
		<colgroup>
		<col width="70%"></col>
		<col width="30%"></col>
		</colgroup>
	<tr>
		<td id="btd1">
	
		<label>검색조건</label>	
		<select id ="search" name="search">
		<option value="all">전체</option>
		<option value="c_materials_title">제목</option>
		<option value="c_materials_memo">내용</option>
		<option value="c_materials_name">작성자</option>
		<option value="c_materials_file">파일명</option>
		</select>
	
		<input type="text" name="keyword"
		id="keyword" value="검색어를 입력하세요"/>
		<input type="button"value="검색" 
		id="searchData" />
		</td>
		<td id="btd2">한페이지에
			<select id="pageSize" name="pageSize">
			<option value ="10">10줄</option>
			<option value ="20">20줄</option>
			<option value ="30">30줄</option>
			<option value ="50">50줄</option>
			<option value ="70">70줄</option>
			<option value ="100">100줄</option>
			</select>
			</td>
			</tr>
		
			</table>
	
	
			</form>
	
	</div>
		<%-- ==============리스트 시작 ================== --%>
			<div id="boardList">
			<table summary="게시판 리스트">
			<colgroup>
			<col width="15%"/>
			<col width="62%"/>
			<col width="15%"/>
			<col width="13%"/>
		<col width="15%"/>
	</colgroup>
	<thead>
	<tr>
		<%--============글쓰기 form ========= --%>
			<form id="form" name="form" method="post">
			<table border="1" align="center">
				<tr><td colspan="7" align="center"><h1>자료실</h1></td></tr>
									<tr>
										<td align="center">글번호</td>
										<td>제목</td>
							
										<td>파일명</td>
										<td align="center">작성자</td>
										<td align="center">작성일</td>
										<td align="center">조회수</td>
										
									</tr>
		<%
			String c_materials_no = "";
			String c_materials_title = "";
			String c_materials_file = "";
			String c_materials_name = "";
			String c_materials_pw = "";
			String c_materials_insertdate = "";
			String c_materials_updatedate = "";
			int c_materials_viewcount;
			Object obj = request.getAttribute("list");
		//	System.out.println("obj >>> : "+obj);
			List list = (List)obj;
			if(list != null && list.size() >0){
				for(int i=0;i<list.size();i++){
					MaterialsVO bvo = (MaterialsVO)list.get(i);
					c_materials_no = bvo.getC_materials_no();
					c_materials_title = bvo.getC_materials_title();
					c_materials_file = bvo.getC_materials_file();
					c_materials_name = bvo.getC_materials_name();	
					c_materials_insertdate = bvo.getC_materials_insertdate();
					c_materials_viewcount = bvo.getC_materials_viewcount();
					%>
					
					<tr data-num="<%=c_materials_no %>">
						<td><%=c_materials_no %></td>
						<td><span class="goDetail"><%=c_materials_title %></span></td>
						<td><%=c_materials_file %></td>
						<td align="center"><%=c_materials_name %>      </td>
						<td align="center"><%=c_materials_insertdate%></td>
						<td align="center"><%=c_materials_viewcount%></td>
					</tr>
						
						
					
					<% 
				}
				
			}else{
				System.out.println("list가 null입니다.");
				%>
				<tr>
					<td>글이 없습니다.</td>
				</tr>
					
					
				
				<% 
			}
		%>

		<div id="boardBut">
				<td colspan="7" align="right">
					<input type="hidden" name="ISUD_TYPE" id="ISUD_TYPE">
					<input type="button" value="글쓰기" name="insert" id="insert">
			</div>
			<div id="boardPage">
			<tag:paging page="${param.page}" total="${total}" list_size="${data.pageSize}"/>

				</div>
				</td>		
			</tr>
			</table>
		</form>
	</body>
</html>