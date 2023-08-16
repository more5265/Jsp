<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="kr.farmstory1.dao.UserDAO"%>
<%@page import="kr.farmstory1.dto.TermsDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
	<%
TermsDTO vo = new TermsDTO();

	try{
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/Farmstory");
		
		Connection conn = ds.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM `terms`");
		
		if(rs.next()){
			vo.setTerms(rs.getString("terms"));
			vo.setPrivacy(rs.getString("privacy"));
		}
		
		
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<%@ include file="../_header.jsp" %>
	<script>
	
	 	window.onload = function(){
	 		
	 		const chk1 = document.getElementsByName('chk1')[0];
	 		const chk2 = document.getElementsByName('chk2')[0];
	 		
	 		const btnNext = document.querySelector('.btnNext');
	 		btnNext.addEventListener('click', function(e){
	 			e.preventDefault();
	 			
	 			if(!chk1.checked){
	 				alert('이용약관에 동의하셔야 합니다.');
	 				return;
	 			}else if(!chk2.checked){
	 				alert('개인정보 취급방침에 동의하셔야 합니다.');
	 				return;
	 			}else{
	 				location.href = '/Farmstory1/user/register.jsp';
	 			}
	 			
	 		});
	 	};
	</script>   
        <div id="user">
                    <section class="terms">
                <table>
                    <caption>사이트 이용약관</caption>
                    <tr>
                        <td>
                            <textarea readonly><%= vo.getTerms() %></textarea>
                            <p>
                                <label><input type="checkbox" id="chk1" name="chk1"/>동의합니다.</label>
                            </p>
                        </td>
                    </tr>
                </table>
                <table>
                    <caption>개인정보 취급방침</caption>
                    <tr>
                        <td>
                            <textarea readonly><%= vo.getPrivacy() %></textarea>
                            <p>
                                <label><input type="checkbox" id="chk2" name="chk2"/>동의합니다.</label>
                            </p>
                        </td>
                    </tr>
                </table>
                <div>
                    <a href="/Farmstory1/user/login.jsp" class="btnCancel">취소</a>
                    <a href="" class="btnNext">다음</a>
                </div>
            </section>
            <img src="/Farmstory1/images/terms.png" alt="약관 샘플">
        </div>
<%@ include file="../_footer.jsp" %>