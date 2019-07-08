<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% session.invalidate(); %>
<jsp:include page="../common/header.jsp" />
<!-- Title here -->
<title>Login</title>
<!-- Form area -->
<div class="admin-form">
	<!-- Widget starts -->
	<div class="widget worange">
		<!-- Widget head -->
		<div class="widget-head">
			<i class="fa fa-lock"></i> Login
		</div>
		<div class="widget-content">
			<div class="padd">
				<!-- Login form -->
				<form class="form-horizontal" action="<%=request.getContextPath()%>/metro/login/userDivider.jsp" method="post">
					<!-- Email -->
					<div class="form-group">
						<label class="control-label col-lg-3" for="inputEmail">ID</label>
						<div class="col-lg-9">
							<input type="text" class="form-control" id="inputId" name="id" placeholder="ID" required="required">
						</div>
					</div>
					<!-- Password -->
					<div class="form-group">
						<label class="control-label col-lg-3" for="inputPassword">Password</label>
						<div class="col-lg-9">
							<input type="password" class="form-control" name="passwd" id="inputPassword"
								placeholder="Password" required="required">
						</div>
					</div>
					<!-- Remember me checkbox and sign in button -->
					<div class="form-group">
						<div class="col-lg-9 col-lg-offset-3">
						</div>
						<div class="col-lg-9 col-lg-offset-3">
							<button type="submit" class="btn btn-danger">로그인</button>
							<button type="reset" class="btn btn-default">Reset</button>
						</div>
					</div>
				</form>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="loginScript.jsp" />
