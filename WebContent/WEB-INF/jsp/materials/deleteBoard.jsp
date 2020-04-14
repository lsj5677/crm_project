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
				c_materials_updatedate = bvo.getC_materials_insertdate();
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
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
		<script type="text/javascript"
				src="https://code.jquery.com/jquery-1.11.0.min.js">
		</script>
		<script type="text/javascript">
			$(document).ready(function(){
				console.log("ready");
				$('#delete').click(function(){
					console.log("delete.click");
					$('#form')
					.attr("action","/materials/deleteBoard.crm")
					.submit();
				});
				$('#main').click(function(){
					console.log("main.click");
					$('#form')
					.attr("action","/materials/listBoard.crm")
					.submit();
				});
			});
		</script>
	</head>
	<body>
		<form name="form" id="form" method="post">
			<table border="1" align="center">
				<tr>
					<td>삭제?</td>
				</tr>
				<tr>
					<td>
						비밀번호 : 
					</td>
					<td>
						<input type="password" name="c_materials_pw" id="c_materials_pw">
					</td>
				</tr>
				<tr>
					<td>
						<input type="hidden" name="c_materials_no" id="c_materials_no" value="<%=c_materials_no %>">
						<input type="button" value="삭제하기" name="delete" id="delete">
						<input type="button" value="메인으로가기" name="main" id="main">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>