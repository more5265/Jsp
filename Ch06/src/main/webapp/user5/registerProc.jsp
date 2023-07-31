<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.apache.catalina.tribes.tipis.ReplicatedMapEntry"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
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
	
	// 데이터베이스 처리 X
			
	
	try{
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		
		DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
		Connection conn = ds.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement("INSERT INTO `user5` VALUES (?,?,?,?,?,?,?)");
		
		psmt.setString(1, uid);
		psmt.setString(2, name);
		psmt.setString(3, birthday);
		psmt.setString(4, gender);
		psmt.setString(5, age);
		psmt.setString(6, address);
		psmt.setString(7, hp);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
	
		
	}catch(Exception e){
		e.printStackTrace();

		response.sendRedirect("/Ch06/user5/list.jsp");
	}



%>