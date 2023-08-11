<%@page import="kr.co.jboard1.dto.ArticleDTO"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String content = request.getParameter("content");
	String parent = request.getParameter("parent");
	String writer = request.getParameter("writer");
	String regip = request.getRemoteAddr();
	
	
	ArticleDTO dto = new ArticleDTO();
	dto.setParent(parent);
	dto.setContent(content);
	dto.setWriter(writer);
	dto.setRegip(regip);
	
	ArticleDAO dao = new ArticleDAO();
	
	//댓글 입력
	dao.insertComment(dto);
	//댓글 카운트
	dao.updateAticleForCommentPlus(parent);
	
	//리다이렉트
	response.sendRedirect("/Jboard1/view.jsp?no="+parent);
	
%>