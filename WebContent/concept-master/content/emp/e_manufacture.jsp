<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="<%=request.getContextPath()%>/concept-master/jqgrid/commonGrid.js"></script>
<title>생산 현황</title>
<div class="dashboard-wrapper">
	<div class="container-fluid dashboard-content">
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="page-header">
					<h2 class="pageheader-title">생산 현황</h2>
				</div>
			</div>
		</div>
		<div class="row">
			<div style="width: 847px; margin-left: auto; margin-right: auto" id="main">
				<div class="card">
					<h5 class="card-header">생산정보 검색</h5>
					<div class="card-body">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<td class="bg-light text-dark">생산번호</td>
									<td colspan="5">
										<input type="text" name="mf_num" id="mf_num" class="form-control-small" value=" --- " readonly="readonly">
									</td>
								</tr>
								<tr>
									<td class="bg-light text-dark">공장번호</td>
									<td>
										<select class="form-control form-control-sm" name="f_num" id="f_num">
											<option></option>
											<c:forEach var="fac" items="${facs}">
												<option value="${fac}">${fac}</option>
											</c:forEach>
										</select>
									</td>
									<td class="bg-light text-dark">생산라인</td>
									<td>
										<select class="form-control form-control-sm" name="pl_num" id="pl_num">
											<option></option>
											<option value="p_1">p_1</option>
											<option value="p_2">p_2</option>
											<option value="p_3">p_3</option>
										</select>
									</td>
									<td class="bg-light text-dark">담당직원</td>
									<td>
										<select class="form-control form-control-sm" name="e_id" id="e_id">
											<option></option>
											<c:forEach var="emp" items="${emps}">
												<option value="${emp}">${emp}</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td class="bg-light text-dark">상품번호</td>
									<td>
										<select class="form-control form-control-sm" name="p_num" id="p_num">
											<option></option>
											<c:forEach var="product" items="${products}">
												<option value="${product}">${product}</option>
											</c:forEach>
										</select>
									</td>
									<td class="bg-light text-dark">생산수량</td>
									<td>
										<input type="number" min="1000" step="500" name="mf_count" id="mf_count" class="form-control-small">
									</td>
									<td class="bg-light text-dark">생산일자</td>
									<td>
										<input type="date" name="mf_date" id="mf_date" class="form-control-small">
									</td>
								</tr>
							</tbody>
						</table>
						<div style="text-align: right; margin-top: 10px">
							<input type="button" onclick="search()" class="btn btn-outline-primary btn-xs" value="검색">
							<input type="button" onclick="insertUpdate()" class="btn btn-outline-success btn-xs" value="등록/수정">
							<input type="button" onclick="reset()" class="btn btn-outline-light btn-xs" value="초기화">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div style="width: 847px; margin-left: auto; margin-right: auto">
				<div class="card">
					<h5 class="card-header">생산 LIST</h5>
					<div class="card-body">
						<table id="gridTable" class="table table-bordered">
						</table>
						<div id="gridPaging"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div style="width: 847px; margin-left: auto; margin-right: auto">
				<div class="card">
					<h5 class="card-header">생산 분석</h5>
					<input type="button" onclick="resetSerch()">
					<div class="card-body">
						<canvas id="chartjs_bar"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		var colNames = ${colNames};
		var colModel = ${colModel};
		var data = ${data};
		var mf_num = "";
		var f_num = "";
		var pl_num = "";
		var e_id = "";
		var p_num = "";
		var mf_count = "";
		var mf_date = "";
		var origin = {};
		var dataSet = "";
		var id = "mf_num";
		var columLength = 7;
		
		function reset() {
			$('#mf_num').val('');
			$('#f_num').val('');
			$('#pl_num').val('');
			$('#e_id').val('');
			$('#p_num').val('');
			$('#mf_count').val('');
			$('#mf_date').val('');
			//list = data;
			$("#gridTable").clearGridData();
			makeTable('gridTable', list, colNames, colModel);
		}

		function search() {
			setData();
			var tableName = "manufacture";
			console.log(searchData);
			 $.ajax({                          
		        type: "POST",
		        url: "<%=request.getContextPath()%>/searchMf.do",
				data : {"searchData" : dataSet},
				datatype : "json",
				success : function(result) {
					var json = JSON.parse(result); 
					list = json;
					$("#gridTable").clearGridData();
					makeTable('gridTable', list, colNames, colModel);
				} 
			}); 
		}
	
		function dubleClick(values){
			$('#mf_num').val(values[0]);
			$('#f_num').val(values[1]);
			$('#pl_num').val(values[2]);
			$('#e_id').val(values[3]);
			$('#p_num').val(values[4]);
			$('#mf_count').val(values[5]);
			$('#mf_date').val(values[6]);	
		}
		
		function insertUpdate() {
			setData();
			if (!isFilled()) {
				alert("입력란을 모두 채워주세요");
			} else {
				 $.ajax({                          
			        type: "POST",
			        url: "<%=request.getContextPath()%>/insertUpdateMf.do",
			        data : {
						"dataSet" : dataSet
					},
					datatype : "json",
					success : function(result) {
						var json = JSON.parse(result);
						list = json;
						$("#gridTable").clearGridData();
						makeTable('gridTable', list, colNames, colModel);
						$("#main").append("<div class='alert alert-success alert-dismissible fade show'  role='alert'>등록/수정 되었습니다.<a href='#' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></a></div>");
					}
				});
			}
		}

		function setData() {
			mf_num = $('#mf_num').val();
			f_num = $('#f_num option:selected').val();
			pl_num = $('#pl_num option:selected').val();
			e_id = $('#e_id option:selected').val();
			p_num = $('#p_num option:selected').val();
			mf_count = $('#mf_count').val();
			mf_date = $('#mf_date').val();
			dataSet = $('#mf_num').val() + ","
					+ $('#f_num option:selected').val() + ","
					+ $('#pl_num option:selected').val() + ","
					+ $('#e_id option:selected').val() + ","
					+ $('#p_num option:selected').val() + ","
					+ $('#mf_count').val() + "," + $('#mf_date').val();
		}
		function isFilled() {
			setData();
			if (mf_num == null || f_num == null || pl_num == null
					|| e_id == null || p_num == null || mf_count == null
					|| mf_date == null || mf_num == "" || f_num == ""
					|| pl_num == "" || e_id == "" || p_num == ""
					|| mf_count == "" || mf_date == "") {
				return false;
			} else {
				return true;
			}
		}
	</script>