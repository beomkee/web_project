<%@page import="service.LeftMenuService"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="model.LeftMenu"%>
<%@page import="java.util.List"%>
<%@page import="dao.LeftMenuDAO"%>
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
		div = "a";
		division = 4;
	}
	LeftMenuService leftService = LeftMenuService.getInstance();
	List<LeftMenu> left = leftService.getLeftMenu(division);
%>
<c:set var="left" value="<%=left%>" />
<c:set var="divi" value="<%=div%>" />
<div class="nav-left-sidebar sidebar-dark">
	<div class="menu-list">
		<nav class="navbar navbar-expand-lg navbar-light">
			<a class="d-xl-none d-lg-none" href="#">Dashboard</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation"
			>
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav flex-column">
					<li class="nav-divider">Menu</li>
					<li class="nav-item "><c:if test="${divi eq 'e'}">
							<a class="nav-link" href="<%=request.getContextPath()%>/main/mainUser.do"> <i class="fa fa-fw fa-user-circle"></i>Dashboard
							</a>
						</c:if> <c:if test="${divi eq 'm'}">
							<a class="nav-link" href="<%=request.getContextPath()%>/main/mainManager.do"> <i class="fa fa-fw fa-user-circle"></i>Dashboard
							</a>
						</c:if> <c:if test="${divi eq 'p'}">
							<a class="nav-link" href="<%=request.getContextPath()%>/main/mainPartner.do?"> <i class="fa fa-fw fa-user-circle"></i>Dashboard
							</a>
						</c:if> <c:if test="${divi eq 'a'}">
							<a class="nav-link" href="<%=request.getContextPath()%>/main/mainAdmin.do"> <i class="fa fa-fw fa-user-circle"></i>Dashboard
							</a>
						</c:if></li>
					<c:forEach var="i" items="${left}">
						<c:if test="${i.collapse eq 'n'}">
							<li class="nav-item"><a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-${i.num}"
								aria-controls="submenu-${i.num}"
							> <i class="fas fa-fw fa-inbox"></i>${i.text}</a>
								<div id="submenu-${i.num}" class="collapse submenu" style="">
									<ul class="nav flex-column">
										<c:forEach var="j" items="${left}">
											<c:if test="${i.num == j.parent_num}">
												<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/${j.url}">${j.text}</a></li>
											</c:if>
										</c:forEach>
									</ul>
								</div></li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</nav>
		<!--========================= 채팅 폼 =============================-->
		<fieldset>
			<div class="chat-body" id="messageWindow"></div>
			<input class="form-control-small form-control-sm" style="width: 79%" id="inputMessage" type="text" /> 
			<input class="btn btn-outline-info btn-xs" type="submit" value="send" onclick="send()" />
		</fieldset>
	</div>
</div>
<style>
.chat-body {
	width: 100%;
	height: 200px;
	border: 1px solid grey;
	overflow: auto;
	background-color: #c7e1fc;
	margin-top: 150px;
}
#me {
	position: relative;
	left: 100px;
}

#you {
	position: relative;
	left: 10px;
}
</style>
<script type="text/javascript">
	$('#inputMessage').keydown(function(e) {
	    if (e.keyCode == 13) {
	    	send();
	    }
	});

    var textarea = document.getElementById("messageWindow");
    var webSocket = new WebSocket('ws://211.63.89.78:9080<%=request.getContextPath()%>/weball');
    var inputMessage = document.getElementById('inputMessage');
    
    webSocket.onerror = function(event){
    	onError(event)   
    };
    
    webSocket.onopen = function(event){
    	onOpen(event)   
    };
    
    webSocket.onmessage = function(event){
    	onMessage(event) 
    };
    
    function onMessage(event) {
	    textarea.innerHTML += "<div  id='you'  class='w3-white "
	    +"w3-border w3-round-large w3-padding-small' "
	    +"style='width:"+(event.data.length*12)+"px;'>"
	    +event.data + "</div><br>";
        textarea.scrollTop=textarea.scrollHeight;
    }
    
    function onOpen(event) {
       textarea.innerHTML += "연결 성공<br>";
       webSocket.send("${user.name}:입장 하였습니다");   
    }
    
    function onError(event) {
	    //alert(event.data);   
	}
    
    function send() {
        textarea.innerHTML += "<div  class='w3-yellow w3-border "
        +"alert alert-warning' "
        +" id='me' style='width: 55%'>" 
        + inputMessage.value 
        + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div><br>";
        textarea.scrollTop=textarea.scrollHeight;
        webSocket.send("${user.name}:" + inputMessage.value);
		inputMessage.value = "";
	}
</script>


