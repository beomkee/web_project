<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String target = request.getParameter("target");
%>
<script>
var checkEmp = function() {
	$.ajax({                          
        type: "POST",
        url: "checkEmpPro.jsp",	
        data: {  "loginId" :loginId },
        datatype: "JSON",
        success: function(result) {  
        	console.log("result : "+result);
        	
       }
    });
}
</script>
<%
	if(target.equals("1")){
		target = "직원";		
	}else{
		target = "파트너";		
	}
%>
<div class="content">
	<!-- Main bar -->
	<div class="mainbar">
		<!-- Page heading -->
		<div class="page-head">
			<!-- Page heading -->
			<h2 class="pull-left">
				<%= target %>등록 및 수정
			</h2>
			<!-- Breadcrumb -->
			<div class="bread-crumb pull-right">
				<a href="index.html"><i class="fa fa-home"></i> Home</a>
				<!-- Divider -->
				<span class="divider">/</span> <a href="#" class="bread-current"><%= target %>등록 및 수정</a>
			</div>
			<div class="clearfix"></div>
		</div>
		<!--/ Page heading ends -->
		<!-- Matter -->
		<div class="matter">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="widget wred">
							<div class="widget-head">
								<div class="pull-left"><%= target %>등록 및 수정</div>
								<div class="widget-icons pull-right">
									<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
									<a href="#" class="wclose"><i class="fa fa-times"></i></a>
								</div>
								<div class="clearfix"></div>
							</div>

							<div class="widget-content">
								<div class="padd">
									<!-- Profile form -->
									<form class="form-horizontal">
										<div class="form-group">
											<label class="control-label col-lg-2" for="name1">빠른 <%=target%> 검색 및 수정</label>
											<div class="col-lg-6">
												<input type="text" class="form-control" id="name1" size="15">
											</div>
											<button type="button" class="btn btn-success" onclick="">검색</button>
										</div>
									</form>
									<div class="form profile">
										<!-- Edit profile form (not working)-->
										<hr>
										<form class="form-horizontal">
											<!-- Country -->
											<div class="form-group">
												<label class="control-label col-lg-2">뭔가쓸일일있을듯</label>
												<div class="col-lg-6">
													<select class="form-control">
														<option value="">--- Please Select ---</option>
														<option value="1">Afghanistan</option>
														<option value="2">Albania</option>
														<option value="3">Algeria</option>
													</select>
												</div>
											</div>
											<!-- Name -->
											<div class="form-group">
												<label class="control-label col-lg-2" for="name1">ID</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" id="name1">
												</div>
											</div>
											<!-- Name -->
											<div class="form-group">
												<label class="control-label col-lg-2" for="name1">PASSWD</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" id="name1">
												</div>
											</div>
											<!-- Email -->
											<div class="form-group">
												<label class="control-label col-lg-2" for="email1">이름</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" id="email1">
												</div>
											</div>
											<!-- Telephone -->
											<div class="form-group">
												<label class="control-label col-lg-2" for="telephone">Tel</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" id="telephone">
												</div>
											</div>
											<!-- Address -->
											<div class="form-group">
												<label class="control-label col-lg-2" for="address">생년월일</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" id="email1">
												</div>
											</div>
											<!-- State -->
											<div class="form-group">
												<label class="control-label col-lg-2" for="city">관리자번호</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" id="state">
												</div>
											</div>
											<!-- City -->
											<div class="form-group">
												<label class="control-label col-lg-2" for="city">공장명</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" id="city">
												</div>
											</div>
											<!-- Username -->
											<div class="form-group">
												<label class="control-label col-lg-2" for="username2">라인명</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" id="username2">
												</div>
											</div>
											<!-- Password -->

											<!-- Buttons -->
											<div class="form-group">
												<!-- Buttons -->
												<div class="col-lg-6 col-lg-offset-2">
													<button type="submit" class="btn btn-success">Update</button>
													<button type="reset" class="btn btn-default">Reset</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/ Matter ends -->
	</div>
	<!--/ Mainbar ends -->
	<div class="clearfix"></div>
</div>