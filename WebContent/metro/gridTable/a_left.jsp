<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/metro/common/header.jsp" />
<jsp:include page="/metro/common/nav.jsp" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Guriddo_jqGrid_JS_5.3.2/css/ui.jqgrid.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/Guriddo_jqGrid_JS_5.3.2/js/jquery.jqGrid.min.js" ></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-ui-1.12.1.custom/jquery-ui.css" >
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-ui-1.12.1.custom/jquery-ui.js" ></script>
<script src="<%=request.getContextPath()%>/Guriddo_jqGrid_JS_5.3.2/js/i18n/grid.locale-kr.js"></script>
<title>LEFT 관리</title>
<script>   
	var list = {};
	var target = "";
/*===================================================== JqGrid 그리는 스크립트 ====================================================== */
	function makeTable(id, array){
			$("#"+id).jqGrid({
				datatype: "local",                                                                              
				height: 'auto',
				autowidth: true,
				colNames:['num','text','depth','collapse','division','url','use_yn','parent_num','del'],                                      
				colModel:[
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
				],                    
				editable		: true,
				rowNum			: 10,
				rowList			: [10,20,30],
				pager			: '#jqGridPager', 
		        loadonce   		: false,
		        sortname		: 'division',
				//cellEdit		: true, 
	      		multiselect   	: true, 
				viewrecords		: true,
				onCellSelect 	: function(){
	    			//console.log("한번클릭")
	    		},
	    		gridComplete	: function(){
	    			$("#jqGrid").trigger("reloadGrid");
	    		},
	    		ondblClickRow 	: function(rowId, iRow, iCol, e) {
	    		
	   	        },
				caption: "Left Menu Data"
				});

		for ( var row in array) {
			$("#" + id).jqGrid('addRowData', row + 1, array[row]);
		} 
		function delButton (cellvalue, options, rowObject) {
   	    	return '<button class="btn" type="button" onclick="deleteGridRow('+options.rowId+')">DEL</button>'; 
   	    };
	}
	$(document).ready(function() {
		resetSerch();
	});
	$(window).resize(function() {
		$("#jqGrid").setGridWidth($('#container').width());
	});
	
	function deleteGridRow(rowId, text){
		//$("#jqGrid").delRowData(rowid);
		if (confirm("정말로 삭제 하시겠습니까?")){
			$.ajax({                          
		        type: "POST",
		        url: "",
					data : {"serchVar" : serchVar,
							"target" : target,
							"colum" : colum},
					datatype : "json",
					success : function(result) {
						var temp = result.trim();
						var json = JSON.parse(temp);
						list = json;
						$("#jqGrid").clearGridData();
						makeTable('jqGrid', list);
					}
				});
		}
		
	}
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
					$("#jqGrid").clearGridData();
					makeTable('jqGrid', list);
				}
			});
	}
/*===================================================== 검색 결과 초기화 스크립트 ====================================================== */
	function resetSerch(){
		$('#serchVar').val('');
		$.ajax({                          
	        type: "POST",
	        url: "<%=request.getContextPath()%>/metro/ajax/leftSearchPro.jsp",
			data : "target=" + target,
			datatype : "json",
			success : function(result) {
				var json = JSON.parse(result);
				list = json;
				$("#jqGrid").clearGridData();
				makeTable('jqGrid', json);
			}
		});
	}
</script>
<div class="content">
	<div class="mainbar">
		<div class="page-head">
			<h2 class="pull-left">LEFT MENU</h2>
			<div class="bread-crumb pull-right">
				<a href="index.html"><i class="fa fa-home"></i> Home</a> <span class="divider">/</span> <a
					href="#" class="bread-current"
				> LEFT MENU </a>
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
								<div class="pull-left">LEFT MENU 검색 조건 설정</div>
								<div class="widget-icons pull-right">
									<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a> 
									<a href="#" class="wclose" ><i class="fa fa-times"></i></a>
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
													<input type="radio" id="colum" name="colum" value="num">num&nbsp;
													<input type="radio" id="colum" name="colum" value="text" >text&nbsp; 
													<input type="radio" id="colum" name="colum" value="depth">depth&nbsp;
													<input type="radio" id="colum" name="colum" value="collapse">collapse&nbsp; 
													<input type="radio" id="colum" name="colum" value="division" >division&nbsp; 
													<input type="radio" id="colum" name="colum" value="url">url&nbsp;
													<input type="radio" id="colum" name="colum" value="use_yn">use_yn&nbsp; 
													<input type="radio" id="colum" name="colum" value="parent_num">parent_num&nbsp; 
													<input type="text" id="serchVar" >
													<input type="button" value="검색" onclick="serchResult();"> 
													<input type="button" value="초기화" onclick="resetSerch();">
												</td>
											</tr>
											<tr>
												<td></td>
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
						<table id="jqGrid"></table>
						<div id="jqGridPager"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
</div>
<jsp:include page="/metro/common/footer2.jsp" />
