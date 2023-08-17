<%@page import="kr.farmstory1.dao.ArticleDAO"%>
<%@page import="kr.farmstory1.dto.ArticleDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");

	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String file = request.getParameter("file");
	String regip = request.getRemoteAddr();
	
	ArticleDTO dto = new ArticleDTO();
	dto.setCate(cate);
	dto.setTitle(title);
	dto.setContent(content);
	dto.setWriter(writer);
	dto.setRegip(regip);
	

	// 데이터베이스 처리
	ArticleDAO dao = new ArticleDAO();
	dao.insertArticle(dto);
	
	
	// 리다이렉트
	response.sendRedirect("/Farmstory1/board/list.jsp?group="+group+"&cate="+cate);
%>