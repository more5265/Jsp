<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Member::list</title>
	</head>
	<body>
		<h3>직원목록</h3>
		<a href="/Ch11">메인</a>
		<a href="/Ch11/register.do">직원등록</a>
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>직급</th>
				<th>부서</th>
				<th>입사일</th>
				<th>관리</th>
			</tr>
    		<c:forEach var="user" items="${requestScope.users}">
        	<tr>
	            <td>${user.getUid()}</td>
	            <td>${user.getName()}</td>
	            <td>${user.getHp()}</td>
	            <td>${user.getPos()}</td>
	            <td>${user.getDep()}</td>
	            <td>${user.getRdate()}</td>
	            <td>
	                <a href="/Ch11/modify.do">수정</a>
	                <a href="/Ch11/delete.do">삭제</a>
	            </td>
        	</tr>
    		</c:forEach>
		</table>
	</body>
</html>