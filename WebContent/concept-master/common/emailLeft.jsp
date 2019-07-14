<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<aside class="page-aside">
	<div class="aside-content">
		<div class="aside-header">
			<button class="navbar-toggle" data-target=".aside-nav" data-toggle="collapse" type="button">
				<span class="icon">
					<i class="fas fa-caret-down"></i>
				</span>
			</button>
			<span class="title">EMail Service</span>
		</div>
		<div class="aside-compose">
			<a class="btn btn-lg btn-secondary btn-block" href="<%= request.getContextPath() %>/concept-master/content/email/emailWrite.jsp">Email 작성</a>
		</div>
		<div class="aside-nav collapse">
			<ul class="nav">
				<li class="active">
					<a href="<%= request.getContextPath() %>/concept-master/content/email/emailList.jsp">
						<span class="icon">
							<i class="fas fa-fw fa-inbox"></i>
						</span>
						Inbox
						<span class="badge badge-primary float-right">8</span>
					</a>
				</li>
				<li>
					<a href="#">
						<span class="icon">
							<i class="fas fa-fw  fa-envelope"></i>
						</span>
						Sent Mail
					</a>
				</li>
				<li>
					<a href="#">
						<span class="icon">
							<i class="fas fa-fw fa-trash"></i>
						</span>
						Trash
					</a>
				</li>
			</ul>
		</div>
	</div>
</aside>