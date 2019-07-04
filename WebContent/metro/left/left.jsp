<%@page import="service.LeftMenuService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="left.LeftMenuDataBean"%>
<%@page import="java.util.List"%>
<%@page import="left.LeftMenuDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String id = (String) session.getAttribute("LOGINED_ID");
	String position = null;
	String div = null;
	int division = 0;
	if (id.charAt(0) == '1') {
		position = "직원";
		div = "e";
		division = 1;
	} else if (id.charAt(0) == '3') {
		position = "파트너";
		div = "p";
		division = 3;
	} else if (id.charAt(0) == '2') {
		position = "매니저";
		div = "m";
		division = 2;
	} else {
		position = "ADMIN";
		div = "m";
		division = 4;
	}
	LeftMenuService leftService = LeftMenuService.getInstance();
	List<LeftMenuDataBean> left = leftService.getLeftMenu(division);
%>
<c:set var="left" value="<%=left%>" />
<div class="sidebar">
	<div class="sidebar-dropdown">
		<a href="#">Navigation</a>
	</div>
	<div class="sidebar-inner">
		<div class="sidebar-widget"></div>
		<ul class="navi">
			<li class="nred current"><a
				href="<%=request.getContextPath()%>/metro/contentJSP/main_<%=div%>.jsp" >
				<i class="fa fa-desktop"></i> Dashboard
			</a></li>
			<c:forEach var="i" items="${left}">
				<c:if test="${i.collapse eq 'n'}">
					<li class="has_submenu ngray"><a href="#"> <i class="fa fa-sitemap"></i>${i.text} <span
							class="pull-right"
						><i class="fa fa-angle-right"></i></span>
					</a> <c:forEach var="j" items="${left}">
							<c:if test="${i.num == j.parent_num}">
								<ul>
									<li><a href="<%=request.getContextPath()%>/metro/${j.url}">${j.text}</a></li>
								</ul>
							</c:if>
						</c:forEach></li>
				</c:if>
			</c:forEach>
		</ul>
		<div class="sidebar-widget">
			<div id="todaydate"></div>
		</div>
	</div>
</div>
