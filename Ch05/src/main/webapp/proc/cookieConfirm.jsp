<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>cookieConfirm</title>
	</head>
	<body>
		<h3>쿠키확인</h3>
		<%
			Cookie[] cookies = request.getCookies();
		
			for(Cookie cookie : cookies){
		%>
			<p>
			쿠키명 : <%= cookie.getName() %>
			쿠키명 : <%= cookie.getValue() %>
			
			</p>		
		<%
			}
		%>
	
		
		
	</body>
</html>