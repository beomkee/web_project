<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- ------------------------------------------------------------  
				jqgirdIUD.jsp 에서 가져옴 
-------------------------------------------------------------  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



	
	
<style>
.gray01 {
	background-color: #DEDFDE;
	width: 300px;
}

.boardTable {
	border-color: #d6d6d6;
	margin-top: 5px;
}

.marginTop {
	margin-top: 40px;
}

.buttonSerch {
	width: 110px;
	height: 34px;
	margin-left: 500px;
	margin-top: 10px;
}
.table_white {
	margin-left: 50px;
}
</style>


<script type="text/javascript">
	
$(document).ready(function() {
	
	jqgridTable.init();
	jqgridTable.goSearch();
	goController.jqgridRowCount();
});




var goController= {
		
		boardDelete : function(rowid){
			
			var  contentId = rowid;
			if (confirm(contentId +"정말로 삭제 하시겠습니까?")){
			$.ajax({
			
				type 	: "POST",
				url	 	: "boardDelete.do",
				data 	: {"contentId" 		: contentId},
				success : function(result){
						alert("삭제성공");
						location.reload();
		        },
		        error: function(request,status,error){
		   			alert("게시글삭제 문제");
		        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		   
		            }
			})
			}
			
		},
		
		jqgridRowCount :  function(){
			
		    $.ajax({                    
		    	
		        type: "POST",
		        url: "jqgridRowCount.do",	
		        datatype:"json",
		        success: function(result) {  
		        		var jsonRes = JSON.parse(result); 
		        		$("#noticeTotCnt").text(jsonRes.selectNotice);
		        		$("#noticeNewCnt").text(jsonRes.selectNewNotice);
		        		$("#eventTotCnt").text(jsonRes.selectEvent);
		        		$("#eventNewCnt").text(jsonRes.selectNewEvent);
		        		$("#qnaTotCnt").text(jsonRes.selectQNA);
		        		$("#qnaNewCnt").text(jsonRes.selectNewQNA);
		        		$("#reviewTotCnt").text(jsonRes.selectReview);
		        		$("#reviewNewCnt").text(jsonRes.selectNewReview);
		        		$("#oneTotCnt").text(jsonRes.selectOne);
		        		$("#oneNewCnt").text(jsonRes.selectNewOne);
				       },
				       
				error: function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

					}
		    });
		}
};




var CommonJsUtil = 
{
    isEmpty : function(val) {
        if (null == val || null === val || "" == val || val == undefined || typeof(val) == undefined || "undefined" == val || "NaN" == val) {
            return true;
        } else {
            return false;
        }
    },
    
    isNumeric : function(val) {
    	if (!/^[0-9]+$/.test(val)) {
            return false;
        } else {
            return true;
        }
    }
}

/******************************************
 * 				jqgrid 
 ******************************************/
var jqgridTable = 
{
	init : function() {
		
		var cnames = ['게시물 번호','분류','상품','제목','답변상태','작성자','작성일', '상품번호', '삭제'];
		
	    $("#jqGrid").jqGrid({
	    	
	        url: "jqgridStartMain.do",
	        datatype: "local",
	        colNames: cnames,
	        colModel:[
   	   			{name:'contentId',				index:'contentId', 				width:70,		key:true,	align:"center"},
	   	   		{name:'boardNm',				index:'boardNm', 				width:100, 					align:"center"},
	   	   		{name:'productNm',				index:'productNm', 				width:150},
	   	   		{name:'contentTitle',			index:'contentTitle', 			width:150},
	   	   		{name:'boardAskedState',		index:'boardAskedState', 		width:150},
	   	   		{name:'writerId',				index:'writerId', 				width:100},
	   	   		{name:'contentDate',			index:'contentDate', 			width:220},
	   	   		{name:'productId',				index:'productId', 				width:220},
	   	   		{name:'btn',       				index:'btn',       				width:100, 		formatter:gridFunc.rowBtn}
			],
			width			: 1137,
	        height			: 480,
	        rowNum			: 20,
	        rowList			: [20,30,40,50,100],
	        pager			: '#jqGridPager',
	        cellEdit		: true,
			cellsubmit		: "clientArray",	
	        rownumbers  	: true, 
	        onCellSelect 	: function(rowId, colId, val, e){
    			
    			var CONTENT_ID = $("#jqGrid").getCell(rowId,'CONTENT_ID');
				var total = $("#jqGrid").getGridParam("colModel"); 
    		},
    		ondblClickRow : function(rowId, iRow, iCol, e) {

    			menu.pageSubmitFn(rowId,"boardPopUp.do")
    	   
   	       },
    		
	        viewrecords 	: true,
	        caption			: ""
	    });
	},
	
	goSearch : function () {

		var jsonObj = {};
		
			// 게시판 분류 선택한 값
			jsonObj.serviceSelectBoardYn = $("#selectBoard").val();
			
			// 검색 조건 및 검색 키워드 선택
			jsonObj.serviceSelectByelementsYn = $("#selectByelements").val();
			jsonObj.serviceSelectByElementsKeyYn = $("#selectByElementsKey").val();
			
			// 작성일 값 가져오기
			jsonObj.serviceSelectStartDateYn = $("#selectStartDate").val();
			jsonObj.serviceSelectEndDateYn = $("#selectEndDate").val();
			
			
		$("#jqGrid").setGridParam({
			
	        datatype : "json",
	        postData : {"param" : JSON.stringify(jsonObj)},
	        loadComplete: function (data){
	        	
	        	$.each(data, function (i, item) { 

					if (i == "rows") {	
						if (item < 1) {							
							alert("데이터가 없습니다.");
						}
					}
	        	});
	        }
	    }).trigger("reloadGrid");
	}
}

/******************************************
 * 				그리드 관련 메소드                                   * 
 ******************************************/
 
  var gridFunc = 
	{
		rowBtn	: function(cellvalue, options, rowObject){
			
			return 	'<a href="javascript:gridFunc.delRow('+options.rowId+');">게시물 삭제</a>';
		},
		
		delRow	: function	(rowid){
			if(rowid!=""){
				$("#jqGrid").delRowData(rowid);
				goController.boardDelete(rowid)
			}
		}
	}
</script>



<div class="content">
	<div class="mainbar">
		<!-- Page heading -->
		<div class="page-head">
			<!-- Page heading -->
			<h2 class="pull-left">
				게시판 관리
				<!-- page meta -->
				<span class="page-meta">게시판 관리 메인 페이지</span>
				
			</h2>
			<!-- Breadcrumb -->
			<div class="bread-crumb pull-right">
				<a href="#" onclick="javascript:menu.pageSubmitFn('admin')"><i class="fa fa-home"></i> Home</a>
				<!-- Divider -->
				<span class="divider">/</span> <a href="boardMain.do" class="bread-current">BoardMain</a>
			</div>
			<div class="clearfix"></div>
		</div>

		<div class="matter">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="widget wred">
							<div class="widget-head">
								<div class="pull-left"> 전체 게시판 현황</div>
								<div class="widget-icons pull-right">
									<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
									<a href="#" class="wclose"><i class="fa fa-times"></i></a>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="widget-content">
								<div class="table-responsive">
									<table class="boardTable" cellspacing="1" cellpadding="3" width="100%" border="1">
										<tbody>
											<tr valign="center" align="left" class="gray01">
												<td class="table_gray" height="26" width="4%">
													<div align="center">
														<input type="checkbox" 	onclick="javascript:check_all('use_board[]', this);">
													</div>
												</td>
												<td class="table_gray" height="26" width="6%">
													<div align="center">게시판<br>유형</div>
												</td>
												
												<td class="table_gray" height="26" width="5%">
													<div align="center">분류</div>
												</td>
												
												<td class="table_gray" height="26" width="*">
													<div align="center">게시판명</div>
												</td>
												
												<td class="table_gray" height="26" width="8%">
													<div align="center">게시판 ID</div>
												</td>
												
												<td class="table_gray" height="26" width="15%">
													<div align="center">권한(쓰기/읽기)</div>
												</td>
												
												<td class="table_gray" height="26" width="10%">
													<div align="center">새글/총갯수</div>
												</td>
												
												<td class="table_gray" height="26" width="20%">
													<div align="center">게시물 관리</div>
												</td>
												
											</tr>

											<tr valign="center" align="left" class="table_white">
												<td height="26">
													<div align="center">
														<input type="checkbox" name="use_board[]" value="1">
													</div>
												</td>
												<td height="26">
													<div align="center">공개</div>
												</td>
												<td height="26">
													<div align="center">운영</div>
												</td>
												<td height="26">&nbsp; <a href="noticeboard.do">공지사항</a> <br>
												</td>
												<td height="26">
													<div align="center">공지</div>
												</td>
												<td height="26">
													<div align="center">
													<select id="writeAuth">
														<option value="admin">관리자</option>
														<option value="member">회원</option>
														<option value="nonMember">비회원</option>
													</select>
													&nbsp; / &nbsp;
													<select id="readAuth">
														<option value="visitor">전체</option>
														<option value="admin">관리자</option>
														<option value="member">회원</option>
														<option value="nonMember">비회원</option>
													</select>
													</div>
												</td>
												<td height="26" style="text-align:center">
													<span id="noticeNewCnt"></span> &nbsp;/&nbsp;<span id="noticeTotCnt"></span>
												</td> 
												<td height="26" nowrap="">
													<div align="center" border="0">
														<a href="noticeboard.do">[전체 글보기]</a>
													</div>
												</td>
											</tr>
											
											
											
											
											<tr valign="center" align="left" class="table_white">
												<td height="26">
													<div align="center">
														<input type="checkbox" name="use_board[]" value="2">
													</div>
												</td>
												<td height="26">
													<div align="center">공개</div>
												</td>
												<td height="26">
													<div align="center">운영</div>
												</td>
												<td height="26">&nbsp; <a href="event.do">이벤트</a> <br>
												</td>
												<td height="26">
													<div align="center">event</div>
												</td>
												<td height="26">
													<div align="center">
														<select id="writeAuth">
														<option value="admin">관리자</option>
														<option value="member">회원</option>
														<option value="nonMember">비회원</option>
													</select>
													&nbsp; / &nbsp;
													<select id="readAuth">
														<option value="visitor">전체</option>
														<option value="admin">관리자</option>
														<option value="member">회원</option>
														<option value="nonMember">비회원</option>
													</select>
													</div>
												</td>
												<td height="26">
													<div style="text-align:center">
														<span id="eventNewCnt"></span>&nbsp;/&nbsp;<span id="eventTotCnt"></span>
													</div>
												</td>
												<td height="26" nowrap="">
													<div align="center" border="0">
														<a href="event.do">[전체 글보기]</a>
													</div>
												</td>
											</tr>
											
											
											
											<tr valign="center" align="left" class="table_white">
												<td height="26">
													<div align="center">
														<input type="checkbox" name="use_board[]" value="3">
													</div>
												</td>
												<td height="26">
													<div align="center">공개</div>
												</td>
												<td height="26">
													<div align="center">회원</div>
												</td>
												<td height="26">&nbsp; <a
													href="review.do">구매후기</a> <br>
												</td>
												<td height="26">
													<div align="center">구매후기</div>
												</td>
												<td height="26">
													<div align="center">
														<select id="writeAuth">
														<option value="member">회원</option>
														<option value="admin">관리자</option>
														<option value="nonMember">비회원</option>
													</select>
													&nbsp; / &nbsp;
													<select id="readAuth">
														<option value="visitor">전체</option>
														<option value="admin">관리자</option>
														<option value="member">회원</option>
														<option value="nonMember">비회원</option>
													</select>
													</div>
												</td>
												<td height="26">
													<div align="center">
														0 / 0
													</div>
												</td>
												<td height="26" nowrap="">
													<div align="center" border="0">
														<a href="review.do">[전체 글보기]</a>
													</div>
												</td>
											</tr>
											
											
											<tr valign="center" align="left" class="table_white">
												<td height="26">
													<div align="center">
														<input type="checkbox" name="use_board[]" value="4">
													</div>
												</td>
												<td height="26">
													<div align="center">공개</div>
												</td>
												<td height="26">
													<div align="center">회원</div>
												</td>
												<td height="26">&nbsp; <a
													href="q&a.do">QNA</a> <br>
												</td>
												<td height="26">
													<div align="center">qna</div>
												</td>
												<td height="26">
													<div align="center">
													<select id="writeAuth">
														<option value="member">회원</option>
														<option value="nonMember">비회원</option>
														<option value="admin">관리자</option>
													</select>
													&nbsp; / &nbsp;
													<select id="readAuth">
														<option value="member">회원</option>
														<option value="visitor">전체</option>
														<option value="admin">관리자</option>
														<option value="nonMember">비회원</option>
													</select>
													</div>
												</td>
												<td height="26">
													<div style="text-align:center">
														<span id="qnaNewCnt"></span>&nbsp;/&nbsp;<span id="qnaTotCnt"></span>
														</div>
												</td>
												<td height="26" nowrap="">
													<div align="center" border="0">
														<a href="q&a.do">[전체 글보기]</a>
													</div>
												</td>
											</tr>
											
											
											<tr valign="center" align="left" class="table_white">
												<td height="26">
													<div align="center">
														<input type="checkbox" name="use_board[]" value="5">
													</div>
												</td>
												<td height="26">
													<div align="center">공개</div>
												</td>
												<td height="26">
													<div align="center">운영</div>
												</td>
												<td height="26">&nbsp; <a
													href="review.do">리뷰</a> <br>
												</td>
												<td height="26">
													<div align="center">리뷰</div>
												</td>
												<td height="26">
													<div align="center">
														<select id="writeAuth">
														<option value="nonMember">비회원</option>
														<option value="admin">관리자</option>
														<option value="member">회원</option>
													</select>
													&nbsp; / &nbsp;
													<select id="readAuth">
														<option value="visitor">전체</option>
														<option value="admin">관리자</option>
														<option value="member">회원</option>
														<option value="nonMember">비회원</option>
													</select>
													</div>
												</td>
												<td height="26" style="text-align:center">
													<span id="reviewNewCnt"></span>&nbsp;/&nbsp;<span id="reviewTotCnt"></span>
												</td>
												<td height="26" nowrap="">
													<div align="center" border="0">
														<a href="review.do">[전체 글보기]</a>
													</div>
												</td>
											</tr>
											
											
											
											<tr valign="center" align="left" class="table_white">
												<td height="26">
													<div align="center">
														<input type="checkbox" name="use_board[]" value="5">
													</div>
												</td>
												<td height="26">
													<div align="center">비공개</div>
												</td>
												<td height="26">
													<div align="center">회원</div>
												</td>
												<td height="26">&nbsp; <a
													href="1t1.do">1대1 문의</a> <br>
												</td>
												<td height="26">
													<div align="center">1t1</div>
												</td>
												<td height="26">
													<div align="center">
														<select id="writeAuth">
														<option value="member">회원</option>
														<option value="admin">관리자</option>
														<option value="nonMember">비회원</option>
													</select>
													&nbsp; / &nbsp;
													<select id="readAuth">
														<option value="member">회원</option>
														<option value="visitor">전체</option>
														<option value="admin">관리자</option>
														<option value="nonMember">비회원</option>
													</select>
													</div>
												</td> 
												<td height="26">
													<div style="text-align:center">
													<span id="oneNewCnt"></span>&nbsp;/&nbsp;<span id="oneTotCnt"></span>
													</div>
												</td>
												<td height="26" nowrap="">
													<div align="center" border="0">
														<a href="1t1.do">[전체 글보기]</a>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="widget wred">
							<div class="widget-head">
								<div class="pull-left">게시물 상세 검색</div>
								<div class="widget-icons pull-right">
									<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
									<a href="#" class="wclose"><i class="fa fa-times"></i></a>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="widget-content">
								<div class="table-responsive">
				
									<table class="boardTable" cellspacing="1" cellpadding="3" width="100%" border="1" style="margin-bottom: 20px;">
										<colgroup>
											<col width="120">
											<col>
										</colgroup>
										<tbody>
											<tr>
												<td class="gray01" height="30" style="padding-left: 20px;">
												 	<span style="color: #a7a7a7;">관리를 원하는 게시판을 선택해주세요.</span>
												</td>
												<td class="table_white">
													<select id="selectBoard" name="sel_board_no" style="width: 200px;">
															<option value="all">전체목록</option>
															<option value="공지">공지</option>
															<option value="이벤트">이벤트</option>
															<option value="리뷰">리뷰</option>
															<option value="1T1">1:1 상담</option>
															<option value="QNA">Q&A</option>
															<option value="상품공지">상품공지</option>
													</select>
												</td>
											</tr>
											<tr align="left">
												<td class="gray01" height="30" style="padding-left: 20px;"> 작성일 </td>
												<td class="table_white"><input type="date" id="selectStartDate" > ~ <input type="date" id="selectEndDate" >	
											</tr>
											<tr>
												<td class="gray01" height="30" style="padding-left: 20px;"> 게시글 찾기 </td>
												
												<td class="table_white">
													<select id="selectByelements">
														<option value="elements">선택</option>
														<option value="title">제목</option>
														<option value="writer">작성자</option>
														<option value="item">상품명 </option>
													</select>
													<input type="text" id="selectByElementsKey">
												</td>
											</tr>
										</tbody>
									</table>
									<input type="button" value="조회" onclick="javascript:jqgridTable.goSearch();" style="margin-left: 500px;">
								</div>		
								<div style="margin-top: 10px;">
									<table id="jqGrid"></table>
						    		<div id="jqGridPager"></div>
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
<span class="totop"><a href="#"><i class="fa fa-chevron-up"></i></a></span>

