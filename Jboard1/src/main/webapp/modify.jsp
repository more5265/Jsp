<%@page import="kr.co.jboard1.dto.ArticleDTO"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page import="kr.co.jboard1.dto.UserDTO"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./_header.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");	

	ArticleDAO dao = new ArticleDAO();
	ArticleDTO dto = dao.selectArticle(no);
%>
<main>
	<section class="modify">
		<h3>글수정</h3>
		<article>
			<form action="#">
				<table>
					<tr>
						<td>아이디</td>
						<td><input type="text"/></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><textarea name="content"></textarea></td>
					</tr>
					<tr>
						<td>휴대폰</td>
						<td><input type="file" name="file" /></td>
					</tr>
					<tr>
						<td>나이</td>
						<td><input type="file" name="file" /></td>
					</tr>
				</table>
				<div>
					<a href="/Jboard1/list.jsp" class="btnCancel">취소</a> <input type="submit"
						class="btnWrite" value="수정완료">
				</div>
			</form>
		</article>
	</section>
</main>
<%@ include file="./_footer.jsp"%>