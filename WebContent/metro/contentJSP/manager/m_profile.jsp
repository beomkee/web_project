<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String target = request.getParameter("target");

	if (target.equals("1")) {
		target = "직원";
	} else {
		target = "파트너";
	}
%>
<title><%= target %> 등록 및 수정</title>
<script>

var checkEmp = function() {
	var div = $('#selectID').val().charAt(0);
	var div2 = "<%=target%>";
	if (div2 == "직원") {
		if (div =='1') {
			serch();
		}else{
			alert("올바른 사번을 입력해주세요");
		}
	}else{
		if (div =='3') {
			serch();
		}else{
			alert("올바른 파트너 번호를 입력해주세요");
		}
	}
}

var serch = function() {	
	$.ajax({                          
        type: "POST",
        url: "<%=request.getContextPath()%>/metro/ajax/checkEmpPro.jsp",
			data : "checkId=" + $('#selectID').val(),
			datatype : "json",
			success : function(result) {
				var temp = result.trim();
				console.log(temp);
				var json = JSON.parse(temp);
				if (json['id'] == 'null') {
					alert("올바른 아이디를 입력해주세요.");					
				}else{
				$('#id').val(json['id']);
				$('#passwd').val(json['passwd']);
				$('#name').val(json['name']);
				$('#tel').val(json['tel']);
				$('#birth').val(json['birth']);
				$('#m_num').val(json['manager_num']);
				$('#f_num').val(json['f_num']);
				$('#pl_num').val(json['pl_num']);
				$('#contract').val(json['contract_date']);
				$("#id").attr("readonly",true); 
				}
			}
		});
	}
	function reset(){
		$('#id').removeAttr('readonly');	
		$('#id').val();
		$('#passwd').val();
		$('#name').val();
		$('#tel').val();
		$('#birth').val();
		$('#m_num').val();
		$('#f_num').val();
		$('#pl_num').val();
		$('#contract').val();
	}
</script>
<div class="content">
	<div class="mainbar">
		<div class="page-head">
			<h2 class="pull-left">
				<%=target%>등록 및 수정
			</h2>
			<div class="bread-crumb pull-right">
				<a href="index.html"><i class="fa fa-home"></i> Home</a>
				<span class="divider">/</span> 
					<a href="#" class="bread-current"><%=target%>등록 및 수정</a>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="matter">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="widget wred">
							<div class="widget-head">
								<div class="pull-left"><%=target%>등록 및 수정
								</div>
								<div class="widget-icons pull-right">
									<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
									<a href="#" class="wclose"><i class="fa fa-times"></i></a>
								</div>
								<div class="clearfix"></div>
							</div>

							<div class="widget-content">
								<div class="padd">
<!--==================================================================== 아이디 검색 ===================================================================== -->
									<form class="form-horizontal">
										<div class="form-group">
											<label class="control-label col-lg-2" for="name1">빠른<%=target%> 검색
											</label>
											<div class="col-lg-6">
												<input type="text" class="form-control" name="selectID"
													id="selectID" size="15">
											</div>
											<button type="button" class="btn btn-success" onclick="checkEmp()">검색</button>
										</div>
									</form>
									<div class="form profile">
										<hr>
<!--==================================================================== 내용 입력 ===================================================================== -->
										<form class="form-horizontal" action="insertUpdateDo.jsp" method="post">
											<input type="hidden" name ="target" value="<%= target %>">
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
											<%
												if (target.equals("직원")) {
											%>
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
												<label class="control-label col-lg-2" for="city">관리자번호</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" required="required" name="manager_num" id="m_num">
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-lg-2" for="city">공장명</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" required="required" name="f_num" id="f_num">
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-lg-2" for="username2">라인명</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" required="required" name="pl_num" id="pl_num">
												</div>
											</div>
											<%
												} else {
											%>
											<div class="form-group">
												<label class="control-label col-lg-2"  for="city">계약일</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" required="required" name="contract_date" id="contract">
												</div>
											</div>
											<%
												}
											%>
											<div class="form-group">
												<div class="col-lg-6 col-lg-offset-2">
													<button type="submit" class="btn btn-success">등록/수정</button>
													<button type="reset" class="btn btn-default" onclick="$('#id').removeAttr('readonly')">리셋</button>
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

<!-- <div class="form-group">
												<label class="control-label col-lg-2">뭔가쓸일일있을듯</label>
												<div class="col-lg-6">
													<select class="form-control">
														<option value="">--- Please Select ---</option>
														<option value="1">Afghanistan</option>
														<option value="2">Albania</option>
														<option value="3">Algeria</option>
													</select>
												</div>
											</div> -->