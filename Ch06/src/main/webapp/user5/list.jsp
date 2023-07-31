<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.net.ConnectException"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="vo.User5VO"%>
<%

	
	List<User5VO> users = new ArrayList<>();
	
	try{
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		
		DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
		Connection conn = ds.getConnection();
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM `user5`");
		
		while(rs.next()){
			User5VO vo = new User5VO();
			
			vo.setUid(rs.getString("uid"));
			vo.setName(rs.getString("name"));
			vo.setBirthday(rs.getString("birthday"));
			vo.setGender(rs.getString("gender"));
			vo.setAge(rs.getInt("age"));
			vo.setAddress(rs.getString("address"));
			vo.setHp(rs.getString("hp"));
			
			users.add(vo);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		request.setAttribute("users", users);
		
		
	}catch(Exception e){
		e.printStackTrace();
	}

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user5::list</title>
	</head>
	<body>
		<h3>User5 목록</h3>
		<a href="/Ch06/1_JDBC.jsp">처음으로</a>
		<a href="/Ch06/user5/register.jsp">User5 등록</a>

		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>나이</th>
				<th>주소</th>
				<th>휴대폰</th>
				<th>관리</th>
			</tr>
			<% for(User5VO vo : users){ %>
			<tr>
				<td><%= vo.getUid() %></td>
				<td><%= vo.getName() %></td>
				<td><%= vo.getBirthday() %></td>
				<td><%= vo.getGender() %></td>
				<td><%= vo.getAge() %></td>
				<td><%= vo.getAddress() %></td>
				<td><%= vo.getHp() %></td>	
				<td>
					<a href="/Ch06/user5/modify.jsp?uid=<%= vo.getUid() %>">수정</a>
					<a href="/Ch06/user5/delete.jsp?uid=<%= vo.getUid() %>">삭제</a>
				</td>
			</tr>
			<% } %>
		</table>
	</body>
</html>