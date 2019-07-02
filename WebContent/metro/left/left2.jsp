<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("LOGINED_ID");
	String position = null;
	String div = null;
	if (id.charAt(0) == '1') {
		position = "직원";
		div = "e";
	} else if (id.charAt(0) == '3') {
		position = "파트너";
		div = "p";
	} else if (id.charAt(0) == '2') {
		position = "관리자";
		div = "m";
	}
%>
<div class="sidebar">
	<div class="sidebar-dropdown">
		<a href="#">Navigation</a>
	</div>
	<div class="sidebar-inner">
		<div class="sidebar-widget">
			<form>
				<input type="text" class="form-control" placeholder="Search">
			</form>
		</div>
		<ul class="navi">
			<li class="nred current"><a
				href="<%= request.getContextPath() %>/metro/contentJSP/main_<%=div%>.jsp"> <i class="fa fa-desktop"></i>
					Dashboard
			</a></li>
			<%
				if (id.charAt(0) == '2') {
			%>
			<jsp:include page="/metro/left/left_m.jsp" />
			<%
				} else if (id.charAt(0) == '3') {
			%>
			<jsp:include page="/metro/left/left_p.jsp" />
			<%
				} else if (id.charAt(0) == '1') {
			%>
			<jsp:include page="/metro/left/left_e.jsp" />
			<%
				}
			%>
		</ul>
		<div class="sidebar-widget">
			<div id="todaydate"></div>
		</div>
	</div>
</div>

