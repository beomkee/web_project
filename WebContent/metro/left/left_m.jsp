<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 직원관리 -->
<li class="has_submenu ngray"><a href="#"> <i
		class="fa fa-sitemap"></i> 직원관리 <span class="pull-right"><i
			class="fa fa-angle-right"></i></span>
</a>
	<ul>
		<li><a href="<%= request.getContextPath()%>/metro/contentJSP/manager/m_emp_info.jsp?target=1">직원 조회</a></li>
		<li><a href="<%= request.getContextPath()%>/metro/contentJSP/manager/m_profile.jsp?target=1">등록 및 수정</a></li>
		<li><a href="register.html">메세지</a></li>
	</ul></li>

<!-- 공장관리 -->
<li class="has_submenu ngray"><a href="#"> <i class="fa fa-th"></i>
		공장관리 <span class="pull-right"><i class="fa fa-angle-right"></i></span>
</a>
	<ul>
		<li><a href="calendar.html">Calendar</a></li>
		<li><a href="post.html">Make Post</a></li>
		<li><a href="login.html">Login</a></li>
		<li><a href="register.html">Register</a></li>
		<li><a href="statement.html">Statement</a></li>
		<li><a href="error-log.html">Error Log</a></li>
		<li><a href="support.html">Support</a></li>
	</ul></li>

<!-- 파트너관리 -->
<li class="has_submenu ngray"><a href="#"> <i
		class="fa fa-bar-chart-o"></i> 파트너관리 <span class="pull-right"><i
			class="fa fa-angle-right"></i></span>
</a>
	<ul>
		<li><a href="<%= request.getContextPath()%>/metro/contentJSP/manager/m_emp_info.jsp">거래정보</a></li>
		<li><a href="<%= request.getContextPath()%>/metro/contentJSP/manager/m_emp_info.jsp?target=3">파트너 조회</a></li>
		<li><a href="<%= request.getContextPath()%>/metro/contentJSP/manager/m_profile.jsp?target=3">등록 및 수정</a></li>
	</ul></li>
<!-- 페이지관리-->
<li class="has_submenu ngray"><a href="#"> <i
		class="fa fa-table"></i> 페이지관리 <span class="pull-right"><i
			class="fa fa-angle-right"></i></span>
</a>
	<ul>
		<li><a href="calendar.html">Calendar</a></li>
		<li><a href="post.html">Make Post</a></li>
		<li><a href="login.html">Login</a></li>
		<li><a href="register.html">Register</a></li>
		<li><a href="statement.html">Statement</a></li>
		<li><a href="error-log.html">Error Log</a></li>
		<li><a href="support.html">Support</a></li>
	</ul></li>

