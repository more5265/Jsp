<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 인코딩 설정
	request.setCharacterEncoding("UTF-8");
	
	// 전송 데이터 수신
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String age = request.getParameter("age");
	
	int result = 0;
	
	try{
		// JNDI 서비스 객체 생성
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env"); // JNDI 기본 환경 이름
		/* 외부 디렉토리에 있는 파일을 참조하는 객체 (ctx)
		 커넥션풀 설정을 해야함 (서버 - 톰캣 - context) */
		 
		 // 커넥션 풀에서 커넥션 가져오기
		 DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
		 Connection conn = ds.getConnection();
		 
		 
		PreparedStatement psmt = conn.prepareStatement("INSERT INTO `user6` VALUES (?,?,?,?)");
		psmt.setString(1, uid);
		psmt.setString(2, name);
		psmt.setString(3, hp);
		psmt.setString(4, age);
		
		result = psmt.executeUpdate(); //
		
		psmt.close();
		conn.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	//response.sendRedirect("/Ch06/user6/list.jsp");
	String jsonData = "{\"result\":"+result+"}";
	out.print(jsonData);
	

%>
	