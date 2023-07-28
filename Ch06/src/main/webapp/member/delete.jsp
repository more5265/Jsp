<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Statement"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("uid");
	

		// 데이터베이스 처리
	String host = "jdbc:mysql://127.0.0.1:3306/userdb";
	String user = "root";
	String pass = "1234";
		
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		PreparedStatement psmt = conn.prepareStatement("DELETE FROM `member` WHERE `uid`=?");

		psmt.setString(1, uid);
		psmt.executeUpdate();

		psmt.close();
		conn.close();

		response.sendRedirect("/Ch06/member/list.jsp");

	}catch(Exception e){
		e.printStackTrace();
	}
%>

