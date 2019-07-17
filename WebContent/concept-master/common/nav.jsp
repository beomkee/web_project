<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="model.LoginUser"%>
<%@page import="dao.UserDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String checkId = (String)session.getAttribute("LOGINED_ID");
	UserDao manager = UserDao.getInstance();
	LoginUser user = manager.getUserInfo(checkId);
%>
<c:set var="user" value="<%=user%>" />
<body>
    <div class="dashboard-main-wrapper">
        <div class="dashboard-header">
            <nav class="navbar navbar-expand-lg bg-white fixed-top">
                <a class="navbar-brand" href="#"><img class="MainLogo" style="height:37px;  margin-left:40px;"src="<%= request.getContextPath() %>/concept-master/img/dow_mainLogo.png"/></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto navbar-right-top">
                        <li class="nav-item dropdown nav-user">
                            <a class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="<%= request.getContextPath() %>/concept-master/img/user/<%= session.getAttribute("LOGINED_ID") %>.jpg" alt="" class="user-avatar-md rounded-circle"></a>
                            <div class="dropdown-menu dropdown-menu-right nav-user-dropdown" aria-labelledby="navbarDropdownMenuLink2">
                                <div class="nav-user-info">
                                    <h5 class="mb-0 text-white nav-user-name">${user.name }님 로그인 환영합니다 </h5>
                                </div>
                                <a class="dropdown-item" href="<%=request.getContextPath() %>/concept-master/content/emp/e_profile.jsp"><i class="fas fa-user mr-2"></i>개인정보</a>
                                <a class="dropdown-item" href="<%=request.getContextPath() %>/concept-master/login/login.jsp"><i class="fas fa-power-off mr-2"></i>Logout</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>