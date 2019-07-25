<%@page import="dao.UserDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String target = request.getParameter("target");
	int division = Integer.parseInt(target);
	if (target.equals("1")) {
		target = "직원";
	} else {
		target = "파트너";
	}
	String seletedId = request.getParameter("seletedId");
	UserDao db = UserDao.getInstance();
	List<String> f_list = db.getFacs("f_num");
%>
<title><%=target%> 등록 및 수정</title>
<div class="content">
	<div class="mainbar">
		<div class="page-head">
			<h2 class="pull-left">
				<%=target%>등록 및 수정
			</h2>
			<div class="bread-crumb pull-right">
				<a href="index.html"><i class="fa fa-home"></i> Home</a> <span
					class="divider">/</span> <a href="#" class="bread-current"><%=target%>등록
					및 수정</a>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="matter">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="widget w597484">
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
											<label class="control-label col-lg-2" for="name1">빠른<%=target%>
												검색
											</label>
											<div class="col-lg-6">
												<input type="text" class="form-control" name="selectID"
													id="selectID" size="15">
											</div>
											<button type="button" class="btn btn-success"
												onclick="checkEmp()">검색</button>
										</div>
									</form>
									<div class="form profile">
										<hr>
										<!--==================================================================== 내용 입력 ===================================================================== -->
										<form class="form-horizontal" action="insertUpdateDo.jsp"
											method="post">
											<input type="hidden" name="target" value="<%=target%>">
											<div class="form-group">
												<label class="control-label col-lg-2" for="name1">ID</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" required="required"
														name="id" id="id">
												</div>
												<button type="button" class="btn btn-default"
													onclick="idValCheck();">ID중복검사</button>
											</div>
											<div class="form-group">
												<label class="control-label col-lg-2" for="name1">PASSWD</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" required="required"
														name="passwd" id="passwd">
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-lg-2" for="email1">이름</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" required="required"
														name="name" id="name">
												</div>
											</div>
											<%
												if (target.equals("직원")) {
											%>
											<div class="form-group">
												<label class="control-label col-lg-2" for="telephone">Tel</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" required="required"
														name="tel" id="tel">
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-lg-2" for="address">생년월일</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" required="required"
														name="birth" id="birth">
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-lg-2">공장번호</label>
												<div class="col-lg-6">
													<select class="form-control" name="f_num" id="f_num" required="required">
														<option value="">--- Please Select ---</option>
													</select>
												</div>
											</div> 
											<div class="form-group">
												<label class="control-label col-lg-2">라인번호</label>
												<div class="col-lg-6">
													<select class="form-control" name="pl_num" id="pl_num" required="required">
														<option value="">공장번호를 선택해주세요</option>
														<option value="123">123</option> 
													</select>
												</div>
											</div> 
											<div class="form-group">
												<label class="control-label col-lg-2">관리자번호</label>
												<div class="col-lg-6">
													<select class="form-control" name="manager_num" id="manager_num" required="required">
														<option value="">공장번호를 선택해주세요</option>
													</select>
												</div>
											</div> 
											<%
												} else {
											%>
											<div class="form-group">
												<label class="control-label col-lg-2" for="city">계약일</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" required="required"
														name="contract_date" id="contract">
												</div>
											</div>
											<%
												}
											%>
											<div class="form-group">
												<div class="col-lg-6 col-lg-offset-2">
													<button type="submit" class="btn btn-success">등록/수정</button>
													<button type="reset" class="btn"
														onclick="resetAll();">리셋</button>
													<button type="button" class="btn btn-default"
														onclick="location.href='<%=request.getContextPath()%>/metro/gridTable/m_info.jsp?target=<%=division%>'">목록</button>
													<button type="button" class="btn btn-danger"
														onclick="deleteEC();">삭제</button>
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
<script>
	var target = "";
	$(document).ready(function() {
		target = "<%= target %>";
		startSet();
		if(<%=seletedId%> != null){
			selected(); 
		}
		$('#f_num').on('change', function() {
			var f_num = this.value;
			setRest("pl_num",f_num);
			setRest("manager_num",f_num); 
		});
	});
	
/* ================================================리셋버튼======================================================================== */
	function resetAll(){
		$('#id').removeAttr('readonly');
		$("#selectID").val('');
		$("#pl_num option").remove();
		$("#manager_num option").remove();
		$("#pl_num").append("<option value=''>공장번호를 선택해주세요</option>");
		$("#manager_num").append("<option value=''>공장번호를 선택해주세요</option>");
	}
	
/* ================================================초기 세팅======================================================================== */
	function startSet(){
		var f_list = "<%= f_list %>";
		f_list = f_list.replace("[","");
		f_list = f_list.replace("]","");
		f_list = f_list.replace(" ","");
		f_list = f_list.split(",");
		for (var i=0;i<f_list.length;i++) {
			$("#f_num").append("<option value='"+ f_list[i] +"'>"+ f_list[i] +"</option>");
		}
	}
	function setRest(colum, f_num, param){
		if (colum == "pl_num") {
			$.ajax({                          
		        type: "POST",
		        url: "<%=request.getContextPath()%>/metro/ajax/startset.jsp",
				data : {"f_num" : f_num,
						"colum" : colum},
				datatype : "json",
				success : function(result) {
					var pl_list = result;
					pl_list = $.trim(pl_list);
					pl_list = pl_list.split(",");
					$("#pl_num option").remove();
					$("#pl_num").append("<option>"+"---Select pl_num ---"+"</option>");
					for (var i = 0;i < pl_list.length;i++) {
						if (param ==  pl_list[i]) {
						$("#pl_num").append("<option value='"+ pl_list[i] +"' selected>"+ pl_list[i] +"</option>");
						}else{
						$("#pl_num").append("<option value=' "+ pl_list[i] +"'>"+ pl_list[i] +"</option>");
						}
					};
				}
			});
		} else {
			$.ajax({                          
		        type: "POST",
		        url: "<%=request.getContextPath()%>/metro/ajax/startset.jsp",
				data : {"f_num" : f_num,
						"colum" : colum},
				datatype : "json",
				success : function(result) {
					var m_list = result;
					m_list = $.trim(m_list);
					m_list = m_list.split(",");
					$("#manager_num option").remove();
					$("#manager_num").append("<option>"+"---Select manager_num ---"+"</option>");
					for (var i = 0;i < m_list.length;i++) {
						if (param ==  m_list[i]) {
						$("#manager_num").append("<option value='"+ m_list[i] +"' selected>"+ m_list[i] +"</option>");
						}else{
						$("#manager_num").append("<option value='"+ m_list[i] +"'>"+ m_list[i] +"</option>");
						}
					};
				}
			});
		}
		
	}
	
/* ================================================검색 Ajax======================================================================== */
	
	var pl_num;
	var manager_num;
	var serch = function() {	
		$.ajax({                          
	        type: "POST",
	        url: "<%=request.getContextPath()%>/metro/ajax/checkEmpPro.jsp",
			data : "checkId=" + $('#selectID').val(),
			datatype : "json",
			success : function(result) {
				var temp = result.trim();
				var json = JSON.parse(temp);
				if (json['id'] == 'null') {
					alert("올바른 아이디를 입력해주세요.");
				} else {
					console.log(json);
					$("#f_num").val(json['f_num']).attr("selected", true);
					var f_num = $("#f_num").val();	
					$('#id').val(json['id']);
					$('#passwd').val(json['passwd']);
					$('#name').val(json['name']);
					$('#tel').val(json['tel']);
					$('#birth').val(json['birth']);
					setRest("pl_num",f_num,json['pl_num']);
					setRest("manager_num",f_num,json['manager_num']);
					$('#contract').val(json['contract_date']);
					$("#id").attr("readonly", true); 
				}
			}
		})
	};
	
/* ================================================유효성검사======================================================================== */
	
	function selected(){
		$('#selectID').val('<%=seletedId%>');
		serch();
	}
	
	var checkEmp = function() {
		var div = $('#selectID').val().charAt(0);
		if (target == "직원") {
			if (div =='1' || div == '2') {
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
	
/* ================================================삭제 Ajax======================================================================== */
	function deleteEC(){
		var deleteID =  $('#id').val();
		if (deleteID == null || deleteID == '') {
			alert("삭제할 아이디를 정확히 입력해주세요");
		}
		$.ajax({                          
	        type: "POST",
	        url: "<%=request.getContextPath()%>/metro/ajax/deleteEmpCus.jsp",
				data : {"deleteId" : deleteID,
						"target" : target},
				datatype : "json",
				success : function(result) {
					location.href="<%= request.getContextPath() %>/metro/gridTable/m_info.jsp?target=<%=division%>";
				}
			});
	}

/* ================================================아이디 중복검사======================================================================== */
	function idValCheck(){
		var id = $('#id').val();
		if (id == '') {
			alert("아이디를 입력하세요");                                                                                   
		} else {
			$.ajax({                          
		        type: "POST",
		        url: "<%=request.getContextPath()%>/metro/ajax/idCheckPro.jsp",
				data : "id=" + id,
				datatype : "json",
				success : function(result) {
					if (result == 'true') {
						alert("중복된 아이디입니다");
						 $('#id').val('')
					}else{
						alert("사용가능한 아이디 입니다");
					}
				}
			});
		}
	}
</script>
