<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session.invalidate();
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/concept-master/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="<%= request.getContextPath() %>/concept-master/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/concept-master/assets/libs/css/style.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/concept-master/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <style>
    html,
    body {
        height: 100%;
    }
    body {
        display: -ms-flexbox;
        display: flex;
        -ms-flex-align: center;
        align-items: center;
        padding-top: 40px;
        padding-bottom: 40px;
    }
    </style>
</head>
<body>
    <div class="splash-container">
        <div class="card ">
            <div class="card-header text-center"><img class="LoginLogo" style="height:37px;"src="<%= request.getContextPath() %>/concept-master/img/dow_mainLogo.png" alt="logo"></div>
            <div class="card-body">
                <form action="<%=request.getContextPath()%>/profile/login.do" method="post">
                    <div class="form-group">
                        <input class="form-control form-control-lg" id="username" type="text" name="id" placeholder="Username" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <input class="form-control form-control-lg" id="password" type="password" name="passwd" placeholder="Password">
                    </div>
                    <button type="submit" class="btn btn-primary btn-lg btn-block">로그인</button>
                </form>
            </div>
        </div>
    </div>
    <script src="<%= request.getContextPath() %>/concept-master/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="<%= request.getContextPath() %>/concept-master/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
</body>
</html>
