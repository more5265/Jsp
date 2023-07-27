<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String uid = request.getParameter("uid"); //name="uid"
	String name = request.getParameter("name"); //name="name"
	String age = request.getParameter("age"); //name="age"
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>userProc</title>
	</head>
	<body>
		<h3>사용자 데이터 수신</h3>
		<p>
			아이디 : <%= uid %><br>
			이름 : <%= name %><br>
			나이 : <%= age %><br>
		</p>
		
		<a href="../1_request.jsp">뒤로가기</a>
		
	</body>
</html>