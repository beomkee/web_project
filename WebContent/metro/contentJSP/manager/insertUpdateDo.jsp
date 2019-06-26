<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="dataBean" class="member.LoginUserDataBean">
	<jsp:setProperty name="dataBean" property="*" />
</jsp:useBean>
<%
	String target = request.getParameter("target");
	DBBeanMysql db = DBBeanMysql.getInstance();
	int check = db.insertUpdate(dataBean, target);

	if (check == 1) {
%>
		<script>
			alert("등록 완료 되었습니다.");
		</script>
<%
		if(target.equals("직원")){
			response.sendRedirect("m_info.jsp?target=1");
		}else{
			response.sendRedirect("m_info.jsp?target=2");
		}
	} else if(check == 2) {
%>
		<script>
			alert("수정 완료 되었습니다.");
		</script>
<%
		if(target.equals("직원")){
			response.sendRedirect("m_info.jsp?target=1");
		}else{
			response.sendRedirect("m_info.jsp?target=2");
		}
	}else if(check == 3){
%>
		<script>
			alert("비밀번호가 틀립니다.");
			history.back();
		</script>
<%	
	}else{
		%>
		<script>
			alert("뭔가 에러발생함...");
			history.back();
		</script>
<%	
	}
%>