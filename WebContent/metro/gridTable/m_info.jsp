<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/metro/common/header.jsp" />
<jsp:include page="/metro/common/nav.jsp" />
<script src="https://code.jquery.com/jquery-1.7.js"></script>                                                       
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jqgrid/css/ui.jqgrid.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/jqgrid/js/jquery.jqGrid.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-ui-1.12.1.custom/jquery-ui.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<%
	String target = request.getParameter("target");
	int division = Integer.parseInt(target); 
	if (target.equals("1")) {
		target = "직원";
	} else {
		target = "파트너";
	}
%>
<title><%=target%> 조회</title>
<script>   
	var list = {};
	var target = "";
/*===================================================== JqGrid 그리는 스크립트 ====================================================== */
	function makeTable(id, array){
		if (target == "직원") {
			
			
			$("#"+id).jqGrid({
				datatype: "local",                                                                    
				height: 500,
				autowidth: true,
				colNames:['아이디','비밀번호','이름','전화번호','생년월일','관리자번호','공장번호','라인번호'],                                      
				colModel:[
					{name:'id',align:'right'},
					{name:'passwd',align:'right'},                                                     
					{name:'name',align:'right'},                                                                     
					{name:'tel',align:'right'},
					{name:'birth',align:'right'},
					{name:'manager_num',align:'right'},
					{name:'f_num',align:'right'},
					{name:'pl_num',align:'right'}                                                 
				],                    
				cellEdit		: true,
				rownumbers 		: true, 
				viewrecords		: true,
				rownumbers  	: true, 
				editable: true,
				onCellSelect 	: function(){
	    			//console.log("한번클릭")
	    		},
	    		ondblClickRow : function(rowId, iRow, iCol, e) {
	    			var id = $("#ectable").getCell(rowId, 'id');
	    			location.href="<%= request.getContextPath() %>/metro/contentJSP/manager/m_profile.jsp?target=<%=division%>&seletedId="+id;
	   	       },
				caption: "<%=target%> Data"
				});

			 } else {
				$("#"+id).jqGrid({
					datatype		: "local",                                                                    
					height			: 200,
					autowidth		: true,
					colNames		:['아이디','비밀번호','이름','계약일자'],                                      
					colModel		:[
						{name:'id',align:'right'},
						{name:'passwd',align:'right'},                                                     
						{name:'name',align:'right'},                                                                     
						{name:'contract_date',align:'right'},
					],    
					rownumbers 		: true, 
					cellEdit		: true,
					viewrecords 	: true,
					onCellSelect 	: function(){
		    			//console.log("한번클릭")
		    		},
		    		ondblClickRow : function(rowId, iRow, iCol, e) {
		    			var id = $("#ectable").getCell(rowId, 'id');
		    			location.href="<%= request.getContextPath() %>/metro/contentJSP/manager/m_profile.jsp?target=<%=division%>&seletedId="+id;
		   	       },
					caption			: "<%= target %> Data"
				});
			} 
		for ( var row in array) {
			$("#" + id).jqGrid('addRowData', row + 1, array[row]);
		} 
	}
	$(document).ready(function() {
		target = "<%= target %>";
		resetSerch();
	});
	$(window).resize(function() {
		$("#ectable").setGridWidth($('#container').width());
	});
/*===================================================== Ajax로 검색하는 스크립트 ====================================================== */
	function serchResult(){
		var serchVar =  $('#serchVar').val();
		var colum = $("input[name=colum]:checked").val();
		if (serchVar == '') {
			alert("검색어를 입력해주세요");
			return false;
		}else if(colum == null){
			alert("검색 조건을 선택해 주세요");
			return false;
		}
		$.ajax({                          
	        type: "POST",
	        url: "<%=request.getContextPath()%>/metro/ajax/serchGridPro.jsp",
				data : {"serchVar" : serchVar,
						"target" : target,
						"colum" : colum},
				datatype : "json",
				success : function(result) {
					var temp = result.trim();
					var json = JSON.parse(temp);
					list = json;
					$("#ectable").clearGridData();
					makeTable('ectable', list);
				}
			});
	}
/*===================================================== 검색 결과 초기화 스크립트 ====================================================== */
	function resetSerch(){
		$('#serchVar').val('');
		$.ajax({                          
	        type: "POST",
	        url: "<%=request.getContextPath()%>/metro/ajax/serchAllGridPro.jsp",
			data : "target=" + target,
			datatype : "json",
			success : function(result) {
				var temp = result.trim();
				console.log(temp);
				var json = JSON.parse(temp);
				console.log(json);
				list = json;
				$("#ectable").clearGridData();
				makeTable('ectable', json);
			}
		});
	}
</script>
<div class="content">
	<div class="mainbar">
		<div class="page-head">
			<h2 class="pull-left">
				<%=target%>	조회
			</h2>
			<div class="bread-crumb pull-right">
				<a href="index.html"><i class="fa fa-home"></i> Home</a> <span
					class="divider">/</span> <a href="#" class="bread-current">
					<%=target%>	조회
				</a>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="matter">
<!-- ===========================================검색조건 설정 테이블 div=========================================== -->
			<div class="container" id="container">
				<div class="row">
					<div class="col-md-12">
						<div class="widget w79a8a9">
							<div class="widget-head">
								<div class="pull-left">
									<%= target %> 검색 조건 설정
								</div>
								<div class="widget-icons pull-right">
									<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
									<a href="#" class="wclose"><i class="fa fa-times"></i></a>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="widget-content">
								<div class="table-responsive">
									<table class="table table-bordered ">
										<thead>
											<tr>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td style="text-align: center;">
													<%
														if(target.equals("직원")){
															%>
															<input type="radio" id="colum" name="colum" value="e_id">아이디&nbsp;
															<input type="radio" id="colum" name="colum" value="e_name">이름&nbsp;
															<input type="radio" id="colum" name="colum" value="e_tel">전화번호&nbsp;
															<input type="radio" id="colum" name="colum" value="e_birth">생년월일&nbsp;
															<input type="radio" id="colum" name="colum" value="manager_num">관리자번호&nbsp;
															<input type="radio" id="colum" name="colum" value="f_num">공장번호&nbsp;
															<input type="radio" id="colum" name="colum" value="pl_num">라인번호&nbsp;
															<%
														} else {
															%>
															<input type="radio" id="colum" name="colum" value="c_id">아이디&nbsp;
															<input type="radio" id="colum" name="colum" value="c_name">이름&nbsp;
															<input type="radio" id="colum" name="colum" value="c_contract_date">계약일자&nbsp;
															<%
														}
													%>
													<input type="text" id="serchVar"><input type="button" value="검색" onclick="serchResult();">
													<input type="button" value="초기화" onclick="resetSerch();">
												</td>
											</tr>
											<tr>
												<td> </td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
<!-- ===========================================그리드 테이블 그려주는 div=========================================== -->
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<table id="ectable"></table>
						<div class="clearfix" id="jqGridPager"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
</div>
<jsp:include page="/metro/common/footer2.jsp" />
