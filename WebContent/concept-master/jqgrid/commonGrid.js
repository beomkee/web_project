	var list = {};
	/*===================================================== JqGrid 그리는 스크립트 ====================================================== */
	function makeTable(id, array, name, model){
			$("#"+id).jqGrid({
				datatype: "local",                                                                              
				height: 'auto',
				autowidth: true,
				colNames: name,                                      
				colModel: model,                    
				editable		: true,
				rowNum			: 15,
				rowList			: [15,20,25],
				pager			: '#gridPaging',
		        loadonce   		: false,
		        sortname		: 'division',
				//cellEdit		: true, 
	      		multiselect   	: true, 
				viewrecords		: true,
				onCellSelect 	: function(){
	    			//console.log("한번클릭")
	    		},
	    		gridComplete	: function(){
	    			$("#gridTable").trigger("reloadGrid");
	    		},
	    		ondblClickRow 	: function(rowId, iRow, iCol, e) {
	    		
	   	        }
				//caption: "Data"
				});

		for ( var row in list) {
			$("#" + id).jqGrid('addRowData', row + 1, list[row]);
		} 
	}
	function delButton (cellvalue, options, rowObject) {
		return '<input type="button" class="btn btn-outline-warning btn-xs" onclick="deleteGridRow('+options.rowId+')" value="del"/>'; 
	};
	$(document).ready(function() {
		list = data;
		$("#gridTable").clearGridData();
		makeTable('gridTable', list, colNames, colModel);
	});
	$(window).resize(function() {
		$("#gridTable").setGridWidth($('#container').width());
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
						$("#gridTable").clearGridData();
						makeTable('gridTable', list);
					}
				});
		}
		
	}
//===================================================== Ajax로 검색하는 스크립트 ======================================================  
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
					$("#gridTable").clearGridData();
					makeTable('gridTable', list);
				}
		});
	}
//===================================================== 검색 결과 초기화 스크립트 ====================================================== 
	function resetSerch(){
		$.ajax({                          
	        type: "POST",
	        url: "<%=request.getContextPath()%>/manufacture.do",
				datatype : "json",
				success : function(result) {
					var json = JSON.parse(temp);
					list = json;
					$("#gridTable").clearGridData();
					makeTable('gridTable', list);
				}
		});
		/*$("#gridTable").clearGridData();
		makeTable('gridTable', list, colNames, colModel);*/
	}
