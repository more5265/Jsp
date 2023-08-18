<%@page import="kr.farmstory1.dao.ArticleDAO"%>
<%@page import="kr.farmstory1.dto.ArticleDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	

	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	String no = request.getParameter("no");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String file = request.getParameter("file");
	
	ArticleDTO dto = new ArticleDTO();
	dto.setTitle(title);
	dto.setContent(content);
	dto.setNo(no);
	

	// 데이터베이스 처리
	ArticleDAO dao = new ArticleDAO();
	dao.insertArticle(dto);
	
	
	// 리다이렉트
	response.sendRedirect("../view.jsp?group="+group+"&cate="+cate+"&no="+no);
%>