<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.jboard1.vo.TermsVO"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	TermsVO vo = new TermsVO();

	try{
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/Jboard");
		
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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jboard1::terms</title>
    <link rel="stylesheet" href="../css/style.css"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>    
	<script>
		$(document).ready(function(){
			$('input[type="checkbox"]').on('change', function(){
				if($('#chk1').prop('checked') && $('#chk2').prop('checked')) {
					$('.btnNext').prop('disabled', false);
				} else {
					$('.btnNext').prop('disabled', true);
				}
			});
	        $('.btnNext').on('click', function(e) {
	            if (!$('#chk1').prop('checked') || !$('#chk2').prop('checked')) {
	                e.preventDefault(); 
	                alert('약관에 대한 동의가 필요합니다.');
	            }
	        });
			
		});
	
	</script>   
</head>
<body>
    <div id="container">
        <header>
            <h3>Board System v1.0</h3>
        </header>
        <main>
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
                    <a href="/Jboard1/user/login.jsp" class="btnCancel">취소</a>
                    <a href="/Jboard1/user/register.jsp" class="btnNext" disabled>다음</a>
                </div>
            </section>
        </main>
        <footer>
            <p>ⓒ Copyright by HSLee.com</p>
        </footer>
    </div>
</body>
</html>