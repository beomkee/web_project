<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		var mf_num,f_num,pl_num,e_id,p_num,mf_count,mf_date = null;
		
		function reset() {
			$('#mf_num').val('');
			$('#f_num').val('');
			$('#pl_num').val('');
			$('#e_id').val('');
			$('#p_num').val('');
			$('#mf_count').val('');
			$('#mf_date').val('');
		}

		function search() {
			setData();
			
		}

		function insertUpdate() {
			setData();
			if (!isFilled()) {
				alert("입력란을 모두 채워주세요");
			}else{
				
			}
		}
		
		function setData(){
			mf_num = $('#mf_num').val();
			f_num = $('#f_num option:selected').val();
			pl_num = $('#pl_num option:selected').val();
			e_id = $('#e_id option:selected').val();
			p_num = $('#p_num').val();
			mf_count = $('#mf_count').val();
			mf_date = $('#mf_date').val();
		}
		function isFilled(){
			setData();
			if (mf_num == null || f_num == null || pl_num == null || e_id == null ||p_num == null || mf_count == null || mf_date == null ||
					mf_num == "" || f_num == "" || pl_num == "" || e_id == "" ||p_num == "" || mf_count == "" || mf_date == "") {
				return false;
			}else{
				return true;
			}
		}
		var colNames = ["mf_num","f_num","pl_num","e_id","p_num","mf_count","mf_date"];
		var colModel = [
			{name:'num',		width: 80,			align:'center',			key: true},
			{name:'text',		width:250,			align:'right', 			editable: true,			sortable:false},                                        
			{name:'depth',		align:'right', 		editable: true, 		},                                     
			{name:'collapse',	align:'right', 		editable: true,
				edittype   : "select",
				editoptions : {                     
                  value : { "1" : "y","2" : "n"}   
               }},
			{name:'division',	align:'right', 		editable: true},
			{name:'url',		width:600,		 	align:'right', 			editable: true,			sortable:false},
			{name:'use_yn',		align:'right', 		editable: true,
				edittype   : "select",
				editoptions : {                     
	                  value : { "1" : "y","2" : "n"}   
	               }},
			{name:'parent_num',	align:'right', 		editable: true,			sortable:false},
			{name:'btn',		align:'center', 	formatter: delButton}          
		];
		
	</script>
	 <script src="<%=request.getContextPath()%>/concept-master/jqgrid/commonGrid.js"></script>
	<%-- <script src="<%=request.getContextPath()%>/concept-master/assets/vendor/charts/charts-bundle/chartjs.js"></script> --%>
	<%-- $(document).ready(function() {
			startSet();
			
			$('#f_num').on('change', function() {
				var f_num = this.value;
				setRest("pl_num",f_num);
				setRest("manager_num",f_num); 
			});
		});
		function startSet(){
			for (var i=0;i<f_list.length;i++) {
				$("#f_num").append("<option value='"+ f_list[i] +"'>"+ f_list[i] +"</option>");
			}
		}
		function setRest(colum, f_num, param){
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
		} --%>