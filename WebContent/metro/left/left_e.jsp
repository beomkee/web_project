<%@page import="left.LeftMenuDataBean"%>
<%@page import="java.util.List"%>
<%@page import="left.LeftMenuDBMysql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<li class="has_submenu ngray"><a href="#">
		<i class="fa fa-sitemap"></i> 개인기록카드
<span class="pull-right"><i class="fa fa-angle-right"></i></span>
</a>
	<ul>
		<li><a
			href="<%=request.getContextPath()%>/metro/contentJSP/profile.jsp">개인상세정보</a></li>
		<li><a
			href="<%=request.getContextPath()%>/metro/contentJSP/e_sale_info.jsp">내
				생산 정보</a></li>
		<li><a
			href="<%=request.getContextPath()%>/metro/contentJSP/e_sale_info.jsp">내
				판매 정보</a></li>
		<li><a
			href="<%=request.getContextPath()%>/metro/contentJSP/e_sale_info.jsp">재료
				주문 내역</a></li>
		<li><a
			href="<%=request.getContextPath()%>/metro/contentJSP/emp/e_sale_info.jsp">내
				생산 정보</a></li>
		<li><a
			href="<%=request.getContextPath()%>/metro/contentJSP/emp/e_sale_info.jsp">내
				판매 정보</a></li>
		<li><a
			href="<%=request.getContextPath()%>/metro/contentJSP/emp/e_sale_info.jsp">재료
				주문 내역</a></li>
	</ul></li>

<!-- 입력폼 -->
<li class="has_submenu ngray"><a href="#"> <i
		class="fa fa-file-o"></i> 입력 <span class="pull-right"><i
			class="fa fa-angle-right"></i></span>
</a>
	<ul>
		<li><a
			href="<%=request.getContextPath()%>/metro/contentJSP/e_form.jsp">서류입력</a></li>
		<li><a
			href="<%=request.getContextPath()%>/metro/contentJSP/emp/e_form.jsp">개인신청</a></li>
	</ul></li>

<!-- 근무생산라인정보 -->
<li class="has_submenu ngray"><a href="#"> <i
		class="fa fa-bar-chart-o"></i> 라인정보 <span class="pull-right"><i
			class="fa fa-angle-right"></i></span>
</a>
	<ul>
		<li><a href="calendar.html">Calendar</a></li>
		<li><a href="register.html">Register</a></li>
	</ul></li>

