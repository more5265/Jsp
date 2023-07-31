<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Statement"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("uid");
		
	try{
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		
		DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
		Connection conn = ds.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement("DELETE FROM `user5` WHERE `uid`=?");

		psmt.setString(1, uid);
		psmt.executeUpdate();

		psmt.close();
		conn.close();

		response.sendRedirect("/Ch06/user5/list.jsp"); // 삭제 완료 후 목록 페이지로 이동

	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>user5::delete</title>
</head>
<body>
	<h3>User5 삭제</h3>
	<a href="/Ch06/1_JDBC.jsp">처음으로</a>
	<a href="/Ch06/user5/list.jsp">User5 목록</a>
	
	<form action="/Ch06/user5/deleteProc.jsp" method="post">
	</form>
</body>
</html>
