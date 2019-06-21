<%@page import="java.util.List"%>
<%@page import="jdbc.DBBeanMysql"%>
<%@page import="board.SaleDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.7.js"></script>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/jqgrid/css/ui.jqgrid.css"/>
<script type="text/javascript" src="<%= request.getContextPath()%>/jqgrid/js/jquery.jqGrid.min.js"></script>
 <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/jquery-ui-1.12.1.custom/jquery-ui.css"></script>
<script type="text/javascript" src="<%= request.getContextPath()%>/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<meta charset="UTF-8">
<title>grid 연습</title>                                                                                   
<%
	String id = "12345";
	DBBeanMysql manager = DBBeanMysql.getInstance();
	List<SaleDataBean> sales = manager.getSalesList(id);
%>
<script>                                                                          
	function makeTable(id, array){
		$("#"+id).jqGrid({
			datatype: "local",                                                                    
			height: 250,
			autowidth: true,
			colNames:['판매번호','생산번호','파트너번호','상품번호','거래시작일','거래수량','거래완료일'],                                      
			colModel:[
				{name:'s_num',align:'right'},
				{name:'mf_num',align:'right'},                                                     
				{name:'c_id',align:'right'},                                                                     
				{name:'p_num',align:'right'},
				{name:'s_obtain_date',align:'right'},
				{name:'s_contract_sum',align:'right'},
				{name:'s_complete_date',align:'right'}                                                 
			],                                                      
			caption: "Sales Data"
		});
		for(var row in array){
	           $("#"+id).jqGrid('addRowData',row+1,array[row]);
	      }
	}
	$(document).ready(function(){                                                       
		var jsonString = JSON.stringify(<%= sales %>);
		var json = JSON.parse(jsonString);
		makeTable('table1',json);
		console.log(json);
	});
</script>
</head>
<body>
	<table id="table1"></table>
</body>
</html>