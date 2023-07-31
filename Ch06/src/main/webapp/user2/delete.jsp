<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("uid");

	
	try{
		//Class.forName("com.mysql.cj.jdbc.Driver");
		//Connection conn = DriverManager.getConnection(host, user, pass);
		
		// JNDI 서비스 객체 생성
		Context initctx = new InitialContext();
		Context ctx = (Context) initctx.lookup("java:comp/env"); // JNDI 기본 환경 이름
		/* 외부 디렉토리에 있는 파일을 참조하는 객체 (ctx)
		 커넥션풀 설정을 해야함 (서버 - 톰캣 - context) */
		 
		 // 커넥션 풀에서 커넥션 가져오기
		 DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
		 Connection conn = ds.getConnection();
		 
		PreparedStatement psmt = conn.prepareStatement("DELETE FROM `user2` WHERE `uid`=?");
		
		psmt.setString(1, uid);
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
		response.sendRedirect("/Ch06/user2/list.jsp");
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>