<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="vo.User2VO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String uid = request.getParameter("uid");
	User2VO user = null;

	// 데이터베이스 처리
	try {
		// JNDI 서비스 객체 생성
		Context initctx = new InitialContext();
		Context ctx = (Context) initctx.lookup("java:comp/env");

		// 커넥션 풀에서 커넥션 가져오기
		DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
		Connection conn = ds.getConnection();

		PreparedStatement psmt = conn.prepareStatement("SELECT * FROM user6 WHERE uid = ?");
		psmt.setString(1, uid);

		ResultSet rs = psmt.executeQuery();

		if (rs.next()) {
			user = new User2VO();
			user.setUid(rs.getString("uid"));
			user.setName(rs.getString("name"));
			user.setHp(rs.getString("hp"));
			user.setAge(rs.getInt("age"));
		}

		rs.close();
		psmt.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user6::modify</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
		<script>
			$(function(){

				
				$.get("./user.jsp?uid=<%=uid%>", function(data) {
					console.log(data);
					
					$('input[name=uid]').val(data.uid);
					$('input[name=name]').val(data.name);
					$('input[name=hp]').val(data.hp);
					$('input[name=age]').val(data.age);
				});
				
				$('input[type=submit]').click(function(e) {
					e.preventDefault();
					
					// 수정 데이터 가져오기
					const uid = $('input[name=uid]').val();
					const name = $('input[name=name]').val();
					const hp = $('input[name=hp]').val();
					const age = $('input[name=age]').val();
					
					// JSON 생성
					const jsonData = {
						"uid": uid,
						"name": name,
						"hp": hp,
						"age": age,	
					};
					
					console.log(jsonData);
					
					
					$.post('./modifyProc.jsp', jsonData, function(data) {
						
						if(data.result >= 1) {
							alert('데이터가 수정되었습니다.');
						 		location.href = './list.jsp';
						} else {
							alert('데이터 수정에 실패하였습니다.');
						}					
				});

			});
		});
		</script>
	</head>
	<body>
		<h3>User6 수정</h3>
		<a href="/Ch06/1_JDBC.jsp">처음으로</a>
		<a href="/Ch06/user6/list.jsp">User6 목록</a>
		
		<form action="#" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid" readonly ></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" ></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="hp" ></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number" name="age" ></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="수정"> </td>
				</tr>
			</table>
		</form>
	</body>
</html>