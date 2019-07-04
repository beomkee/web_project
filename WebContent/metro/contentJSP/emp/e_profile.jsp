<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	var checkId = "<%=session.getAttribute("LOGINED_ID")%>"
	$(document).ready(function(){
		serch();
	});
	var serch = function() {	
		$.ajax({                          
	        type: "POST",
	        url: "<%=request.getContextPath()%>/metro/ajax/checkEmpPro.jsp",
				data : "checkId=" + checkId,
				datatype : "json",
				success : function(result) {
					var temp = result.trim();
					var json = JSON.parse(temp);
					console.log(json);
					$('#id').val(json['id']);
					$('#passwd').val(json['passwd']);
					$('#name').val(json['name']);
					$('#tel').val(json['tel']);
					$('#birth').val(json['birth']);
					$('#f_num').val(json['f_num']);
					$('#pl_num').val(json['pl_num']);
					$('#manager_num').val(json['manager_num']);
					$("#id").attr("readonly", true);
					$("#name").attr("readonly", true);
					$("#f_num").attr("readonly", true);
					$("#pl_num").attr("readonly", true);
					$("#manager_num").attr("readonly", true);
				}
			})
		};
</script>
<div class="content">
	<div class="mainbar">
		<div class="page-head">
			<h2 class="pull-left">
				Profile <span class="page-meta">개인정보 조회</span>
			</h2>
			<div class="bread-crumb pull-right">
				<a href="index.html"><i class="fa fa-home"></i> Home</a> <span class="divider">/</span> <a
					href="#" class="bread-current"
				>Profile</a>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="matter">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="widget wred">
							<div class="widget-head">
								<div class="pull-left">Profile</div>
								<div class="widget-icons pull-right">
									<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a> <a href="#"
										class="wclose"
									><i class="fa fa-times"></i></a>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="widget-content">
								<div class="padd">
									<div class="form profile">
										<form class="form-horizontal" action="insertUpdateDo.jsp" method="post">
											<div class="form-group">
												<label class="control-label col-lg-2" for="name1">ID</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" required="required" name="id" id="id">
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-lg-2" for="name1">PASSWD</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" required="required" name="passwd" id="passwd">
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-lg-2" for="email1">이름</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" required="required" name="name" id="name">
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-lg-2" for="telephone">Tel</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" required="required" name="tel" id="tel">
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-lg-2" for="address">생년월일</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" required="required" name="birth" id="birth">
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-lg-2">공장번호</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" required="required" name="f_num" id="f_num">
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-lg-2">라인번호</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" required="required" name="pl_num" id="pl_num">
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-lg-2">관리자번호</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" required="required" name="manager_num" id="manager_num">
												</div>
											</div>
											<div class="form-group">
												<div class="col-lg-6 col-lg-offset-2">
													<button type="submit" class="btn btn-success">수정</button>
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
	</div>
	<div class="clearfix"></div>
</div>