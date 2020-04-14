<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.crm.vo.MaterialsVO" %>
<%@ page import="java.util.List" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>ajax.jsp</title>
	</head>
	<body>
		<%	
			boolean bool = false;
			Object obj = request.getAttribute("result");
			System.out.println("obj >>> : "+obj);
			List list = (List)obj;
			
			if(list.size() > 0 && list != null){
				bool = false;
			}else{
				bool = true;
			}
			System.out.println("bool >>> : "+bool);
		%>
		<?xml version='1.0' encoding='UTF-8'?>
			<login>
				<result><%=bool%></result>
			</login>
	</body>
</html>