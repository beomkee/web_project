<%@page import="model.LoginUser"%>
<%@page import="dao.UserDao"%>
<%@page import="loginCookie.LoginCookie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("LOGINED_ID");
	UserDao manager = UserDao.getInstance();
	LoginUser userInfo = manager.getUserInfo(id);
	String position = null;
	String div = null;
	if (id.charAt(0) == '1') {
		position = "직원";
		div = "e";
	} else if (id.charAt(0) == '3') {
		position = "파트너";
		div = "p";
	} else if (id.charAt(0) == '2') {
		position = "매니저";
		div = "m";
	} else{
		position = "ADMIN";
		div = "m";
	}
%>
<div class="navbar navbar-inverse navbar-fixed-top bs-docs-nav"
	role="banner">
	<div class="container">
		<div class="navbar-header">
			<button class="navbar-toggle" type="button" data-toggle="collapse"
				data-target=".bs-navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a href="<%= request.getContextPath() %>/metro/contentJSP/main_<%=div%>.jsp" class="navbar-brand"><%=position%>
				<span class="bold">페이지</span></a>
		</div>
		<nav class="collapse navbar-collapse bs-navbar-collapse"
			role="navigation">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a data-toggle="dropdown"
					class="dropdown-toggle" href="#"> <img
						src="<%=request.getContextPath()%>/metro/img/user.jpg" alt=""
						class="nav-user-pic img-responsive" /> <%= userInfo.getName()%>
						<b class="caret"></b>
				</a> 
					<ul class="dropdown-menu">
						<li><a href="#"><i class="fa fa-user"></i> Profile</a></li>
						<li><a href="#"><i class="fa fa-cogs"></i> Settings</a></li>
						<li><a
							href="<%=request.getContextPath()%>/metro/login/login.jsp"><i
								class="fa fa-power-off"></i> Logout</a></li>
					</ul></li>
			</ul>
		</nav>
	</div>
</div>
<jsp:include page="/metro/left/left.jsp" />