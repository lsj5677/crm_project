<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!-- boardList link -->
<ul class="boardList-link">
	<li><a href="/board/boardList.crm?c_board_select=전체" title="전체게시판">전체게시판</a></li>
	<li><a href="/board/boardList.crm?c_board_select=공지사항"
		title="공지사항">공지사항</a></li>
	<li><a href="/board/boardList.crm?c_board_select=자유게시판"
		title="자유게시판">자유게시판</a></li>
	<li><a href="/materials/listBoard.crm" title="자료실">자료실</a></li>
</ul>

