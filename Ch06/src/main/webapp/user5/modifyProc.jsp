<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.User5VO"%>
<%@ page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.net.ConnectException"%>
<%@ page import="java.sql.SQLException"%>
<%
		// 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		
		// 전송 데이터 수신
		String uid = request.getParameter("uid");
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		String gender = request.getParameter("gender");
		String age = request.getParameter("age");
		String address = request.getParameter("address");
		String hp = request.getParameter("hp");
		
		try{
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		
		DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
		Connection conn = ds.getConnection();
			
		PreparedStatement psmt = conn.prepareStatement("UPDATE `user5` SET `name`=?, `birthday`=?, `gender`=?, `age`=?, `address`=?, `hp`=? WHERE `uid`=?");

		psmt.setString(1, name);
		psmt.setString(2, birthday);
		psmt.setString(3, gender);
		psmt.setString(4, age);
		psmt.setString(5, address);
		psmt.setString(6, hp);
		psmt.setString(7, uid);
		

		psmt.executeUpdate();

		psmt.close();
		conn.close();

		response.sendRedirect("/Ch06/user5/list.jsp");
		
	}catch(Exception e){
		e.printStackTrace();
		
	}

%>
