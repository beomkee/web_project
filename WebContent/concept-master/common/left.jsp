<%@page import="service.LeftMenuService"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="left.LeftMenuDataBean"%>
<%@page import="java.util.List"%>
<%@page import="left.LeftMenuDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String id = (String) session.getAttribute("LOGINED_ID");
	String position = null;
	String div = null;
	String mainPath = null;
	int division = 0;
	if (id.charAt(0) == '1') {
		position = "직원";
		div = "e";
		division = 1;
		mainPath = "emp/main_e.jsp";
	} else if (id.charAt(0) == '3') {
		position = "파트너";
		div = "p";
		division = 3;
		mainPath = "partner/main_p.jsp";
	} else if (id.charAt(0) == '2') {
		position = "매니저";
		div = "m";
		division = 2;
		mainPath = "manager/main_m.jsp";
	} else {
		position = "ADMIN";
		div = "m";
		division = 4;
		mainPath = "admin/main_a.jsp";
	}
	LeftMenuService leftService = LeftMenuService.getInstance();
	List<LeftMenuDataBean> left = leftService.getLeftMenu(division);
%>
<c:set var="left" value="<%=left%>" />
<div class="nav-left-sidebar sidebar-dark">
	<div class="menu-list">
		<nav class="navbar navbar-expand-lg navbar-light">
			<a class="d-xl-none d-lg-none" href="#">Dashboard</a>
            	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                	<span class="navbar-toggler-icon"></span>
                </button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav flex-column">
					<li class="nav-divider">Menu</li>
					 	<li class="nav-item ">
							<a class="nav-link" href="<%= request.getContextPath() %>/concept-master/content/<%= mainPath %>">
							<i class="fa fa-fw fa-user-circle"></i>Dashboard 
							</a>
						</li>
						<c:forEach var="i" items="${left}">
							<c:if test="${i.collapse eq 'n'}">
							<li class="nav-item">
							<a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" 
								data-target="#submenu-${i.num}" aria-controls="submenu-${i.num}">
								<i class="fas fa-fw fa-inbox"></i>${i.text}</a>
								<div id="submenu-${i.num}" class="collapse submenu" style="">
								<ul class="nav flex-column">
									<c:forEach var="j" items="${left}">
										<c:if test="${i.num == j.parent_num}">
											<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/concept-master/content/${j.url}.jsp">${j.text}</a></li>
										</c:if>
									</c:forEach>
								</ul>
							</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</nav>
	</div>
</div>
