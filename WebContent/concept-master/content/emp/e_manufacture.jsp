<%@page import="JSON.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="<%=request.getContextPath()%>/concept-master/customJs/commonGrid.js"></script>
<script src="<%=request.getContextPath()%>/concept-master/customJs/Chart.min.js"></script>
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
					<div class="card-body" id="gridbody">
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
						<button onclick="makeBar()">막대그래프</button>
						<canvas id="canvas_bar" height="450" width="600"></canvas>
						<canvas id="canvas_curve" height="450" width="600"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--======================= JqGrid 스크립트 =======================  -->
	<script>
		/* var facs = ${facs};
		var emps = %{emps};
		var products = ${products};
		*/
		function drawGraph(){
			makeBarGraph();
		}
		//그리드 속성=====================
		var colNames = ${colNames};
		var colModel = ${colModel};
		var data = ${data};
	</script>
	<script src="<%=request.getContextPath()%>/concept-master/customJs/manufacture.js"></script>
	
	<!--======================= BarChart 스크립트 =======================  -->
	
	<script>
		//bar graph 속성=====================
		var barGraph = {};
		console.log(typeof(barGraph));
		var barKey = "January,"+ "February,"+ "March,"+ "April,"+ "May,"+ "June,"+ "July,"+ "August,"+ "September,"+ "October,"+ "November,"+ "December";
		var barValue1 = "30"+ ",65"+ ",97"+ ",84"+ ",78"+ ",94"+ ",15"+ ",35"+ ",65"+ ",75"+ ",15"+ ",35";
		var barValue2 = "65, 87, 54, 15, 65, 45, 85, 32, 47, 85, 96, 15";
		var name = "mf";
		
		
		
	</script>
	<script src="<%=request.getContextPath()%>/concept-master/customJs/barChart.js"></script>
	<%-- <script src="<%=request.getContextPath()%>/concept-master/customJs/curveChart.js"></script> --%>
	
	<script>
		
	</script>