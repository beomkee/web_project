<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <script src="<%=request.getContextPath()%>/concept-master/jqgrid/commonGrid.js"></script>--%>
<script src="<%=request.getContextPath()%>/concept-master/customJs/gridTableJS.js"></script>
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
			<div style="width: 847px; margin-left: auto; margin-right: auto">
				<div class="card">
					<h5 class="card-header">생산정보 검색</h5>
					<div class="card-body">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<td class="bg-light text-dark">생산번호</td>
									<td colspan="5">
										<input type="text" name="mf_num" id="mf_num" class="form-control-small">
									</td>
								</tr>
								<tr>
									<td class="bg-light text-dark">공장번호</td>
									<td>
										<select class="form-control form-control-sm" name="f_num" id="f_num">
                                              <option></option>
                                              <option value="sw_12345">sw_12345</option>
                                              <option value="yi_45678">yi_45678</option>
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
                                              <option value="12345">12345</option>
                                        </select>
									</td>
								</tr>
								<tr>
									<td class="bg-light text-dark">상품번호</td>
									<td>
										<input type="text" name="p_num" id="p_num" class="form-control-small">
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
					<div class="card-body">
						<canvas id="chartjs_bar"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		var colNames = "mf_num,f_num,pl_num,e_id,p_num,mf_count,mf_date";
		var tableName = "manufactures";
		var options = "0,2,1,0,2,1,0";
		$(document).ready(function() {
			$.ajax({                          
		        type: "POST",
		        url: "<%=request.getContextPath() %>/drawGrid.do",
				data : {"colNames" 	:	colNames,
						"tableName" : 	tableName,
						"options"	:	options},
				datatype : "json",
				success : function(result) {
					console.log("<%= request.getParameter("data") %>")
					/* var json = JSON.parse(result);
					list = json;
					$("#gridTable").clearGridData();
					makeTable('gridTable', json); */
				}
			});
		});
	</script>
	