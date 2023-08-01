<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.PrintWriter"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String uid = request.getParameter("uid");

    try {
        // JNDI 서비스 객체 생성
        Context initctx = new InitialContext();
        Context ctx = (Context) initctx.lookup("java:comp/env");

        // 커넥션 풀에서 커넥션 가져오기
        DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
        Connection conn = ds.getConnection();

        // SQL 문장 준비
        String sql = "DELETE FROM `user6` WHERE `uid`=?";
        PreparedStatement psmt = conn.prepareStatement(sql);
        psmt.setString(1, uid);

        // DELETE 문장 실행
        int result = psmt.executeUpdate();

        psmt.close();
        conn.close();

        // 결과를 호출한 곳으로 전송 (list.jsp)
        response.getWriter().print(result); 
    } catch (Exception e) {
        e.printStackTrace();
    }
%>