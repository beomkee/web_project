<%@page import="jdbc.DBBeanMysql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%
	String loginId = request.getParameter("id");
	String passwd = request.getParameter("passwd");

	DBBeanMysql manager = DBBeanMysql.getInstance();
	int check = manager.userCheck(loginId,passwd);
	
	if(check == 1){
		session.setAttribute("LOGINED_ID", loginId);
		
		if (loginId.charAt(0) == '1') {
			%>
			<jsp:forward page='<%="/concept-master/content/emp/main_e.jsp"%>' /> 
			<%
		} else if (loginId.charAt(0) == '3') {
			%>
			<jsp:forward page='<%="/concept-master/content/partner/main_p.jsp"%>' /> 
			<%
		} else if (loginId.charAt(0) == '2') {
			%>
			<jsp:forward page='<%="/concept-master/content/manager/main_m.jsp"%>' /> 
			<%
		}else if (loginId.equals("admin")) {
			%>
			<jsp:forward page='<%="/concept-master/content/admin/main_a.jsp"%>' /> 
			<%
		}
	}else if(check == 2){
		%>
		<script>
			alert("아이디가 틀립니다");
			history.back();
		</script>
	<%
	}else{
		%>
			<script>
				alert("비밀번호가 틀립니다");
				history.back();
			</script>
		<%
	}
%>
