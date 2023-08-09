<%@page import="kr.co.jboard1.dto.UserDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
//현재 로그인 여부를 확인
	UserDTO sessUer = (UserDTO) session.getAttribute("sessUser");
	
	if(sessUer == null){
		// forward는 시스템 내에서 차원 이동이기 때문에 서버경로 대신 상대경로 지정
		pageContext.forward("./user/login.jsp");
	}else{
		pageContext.forward("./list.jsp"); //서버 경로 사용 X 직접 찾아가야함
	}
%>