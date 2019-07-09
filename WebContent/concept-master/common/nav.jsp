<%@page import="member.LoginUserDataBean"%>
<%@page import="jdbc.DBBeanMysql"%>
<%  
	String checkId = (String)session.getAttribute("LOGINED_ID");
	DBBeanMysql manager = DBBeanMysql.getInstance();
	LoginUserDataBean user = manager.getUserInfo(checkId);
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
                                    <h5 class="mb-0 text-white nav-user-name">${user.name } </h5>
                                    <span class="status"></span><span class="ml-2">${user.f_num} - ${pl_num}</span>
                                </div>
                                <a class="dropdown-item" href="#"><i class="fas fa-user mr-2"></i>Account</a>
                                <a class="dropdown-item" href="#"><i class="fas fa-cog mr-2"></i>Setting</a>
                                <a class="dropdown-item" href="<%=request.getContextPath() %>/concept-master/login/login.jsp"><i class="fas fa-power-off mr-2"></i>Logout</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
