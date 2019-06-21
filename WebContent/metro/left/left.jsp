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
<script>
	window.onload = function (){
		var litag = document.getElementsByTagName("li");
		var url = document.location.href.split("/");
		if(url[url.length-2]=="member"){
			litag[4].className += " w3-green";
		}else if(url[url.length-2]=="chartjsPro"){
			litag[5].className += " w3-green";
		}else if(url[url.length-2]=="awesomePro"){
			litag[6].className += " w3-green";
		}<%-- else{
			atag[<%= boardid %>].className += " w3-green";
		} --%>
	}
</script>
<div class="sidebar">
	<div class="sidebar-dropdown">
		<a href="#">Navigation</a>
	</div>
	<div class="sidebar-inner">
		<!-- Search form -->
		<div class="sidebar-widget">
			<form>
				<input type="text" class="form-control" placeholder="Search">
			</form>
		</div>
		<!--- Sidebar navigation -->
		<ul class="navi">
			<li class="nred current"><a
				href="../contentJSP/main_<%= div %>.jsp"> <i class="fa fa-desktop"></i>
					Dashboard
			</a></li>
			<!-- Menu with sub menu -->
			<%
				if (id.charAt(0) == '2') {
			%>
			<jsp:include page="left_m.jsp" />
			<%
				} else if (id.charAt(0) == '3') {
			%>
			<jsp:include page="left_p.jsp" />
			<%
				} else if (id.charAt(0) == '1') {
			%>
			<jsp:include page="left_e.jsp" />
			<%
				}
			%>
		</ul>
		<!--/ Sidebar navigation -->
		<!-- Date -->
		<div class="sidebar-widget">
			<div id="todaydate"></div>
		</div>
	</div>
</div>
<!-- Sidebar ends -->
<!-- If the main navigation has sub navigation, then add the class "has_submenu" to "li" of main navigation. -->
<!-- Use the class nred, ngreen, nblue, nlightblue, nviolet or norange to add background color. You need to use this in <li> tag. -->

