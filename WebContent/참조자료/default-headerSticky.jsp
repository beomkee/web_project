<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<script type="text/javascript">
	
var HeaderSticky = 
{	
	pageSubmitFn : function(pageName) {
		
		$("#frm").attr("method", "post");
		
		$("#pageName").val(pageName);
	
		$("#frm").attr("action", pageName+".do");	
		
		$("#frm").submit();
	},
	pageCataFn : function(pageName, catagory) {
		
		$("#pageName").val(pageName);
		$("#catagory").val(catagory);
		
		$("#frm").attr("action", pageName+".do");	
		
		$("#frm").submit();
	},
	shopDetailFn : function(pageName, productId, productUrl) {
		
		$("#pageName").val(pageName);
		// $("#catagory").val();
		$("#productId").val(productId);

		$("#frm").attr("action", pageName+".do");	
		
		cookiePic.setCookieArray(productId, productUrl);	// 쿠키 추가하기.
		
		$("#frm").submit();
	},
	setAddCart : function(productId, productUrl){
		
		cookiePic.setCookieArray(productId, productUrl);
	},
	shopMainFn : function(pageName, productId, productUrl) {
		
		$("#pageName").val(pageName);
		
		$("#productId").val(productId);

		$("#frm").attr("action", pageName+".do");	
		
		cookiePicMain.setCookieArrayMain(productId, productUrl);
		
		$("#frm").submit();
	},
	setAddCartMain : function(productId, productUrl){
		
		cookiePicMain.setCookieArrayMain(productId, productUrl);
	},
	
	//이벤트 디테일~!
	eventDetailFn : function(pageName,eventId,eventTt){
		
		$("#pageName").val(pageName);
		
		$("#eventId").val(eventId);
		
		$("#eventTt").val(eventTt);
		$("#frm").attr("action", pageName+".do");	
		$("#frm").submit();
	}
}
	
	

	////////////////////////////메뉴디비화/////////////////////////////////////
var left = 
{
	findMainMenuFn: function(){
		ajaxCl.ajaxCallFn({url : "ireliaMainHeader.do" , FCGGubun : "F"});
		
		},
		
		pageSubmitFn : function(pageName, pageUrl, iMenuNm, level) {
												
			$("#pageName").val(pageName);
			$("#productNm").val(iMenuNm);
			$("#level").val(level);
			
			
			$("#frm").attr("action", pageUrl);
			//$("#frm").attr("method","post");
			$("#frm").submit();
		}
	
}

var ajaxCl =
	{
	
			ajaxCallFn 	: 	function(options){
				
				var that = this;
				
				var settings = {
						
								url : "plus.do" ,
								FCGGubun : "F"
						}
						settings = $.extend({}, settings, options);
						
						$.ajax({
								
							type		:	"POST",
							url			:	settings.url,  // 현재  이 값은 ".do" 가 됨
							async		:	false,
							success : function(result){
								
								
								var jsonRes = JSON.parse(result); 
								
								
									$.each(jsonRes , function (i, item){
										
										if(item.iCollapseYn == 'Y'){
											var strSubMenu = "";

											// 서브 메뉴 가져오기
						                    strSubMenu = that.ajaxSubCallFn({url: "ireliaMainHeader.do", FCGubun: "C", iMenuId: item.iMenuId});

											var strMenu2 = "";
						                      
						                      strMenu2 += '<li class="" id="menu' + item.iMenuId + '">'
														+'<a href="#" onclick="javascript:left.pageSubmitFn(\'menu' + item.iMenuId + '\',\'' + item.iMenuUrl + '\',\'' + item.iMenuNm + '\',\'0\')">'
														+ item.iMenuNm   
														+ '</a>'
														
					                                    			 + '<ul>'
					                                      				  + strSubMenu  // 2뎁스의 하위 메뉴을 표현하기 위한 <li> 태그 3줄이 이자리에 들어오게 된다.
					                                     			+ '</ul>'
					                                 	+ '</li>';
						                                    
						                      $("#targetMenu").append(strMenu2);
										}else{
											console.log(jsonRes);
											var strMenu = "";
										 
			                            
											strMenu +=   '<li class="" id="menu' + item.iMenuId + '">'
											+'<a href="#" onclick="javascript:left.pageSubmitFn(\'menu' + item.iMenuId + '\',\'' + item.iMenuUrl + '\',\'' + item.iMenuNm + '\',\'0\')">'
											+ item.iMenuNm   
											+ '</a>'
				                            + '</li>';
			                            
			                            
											
										}
										$("#targetMenu").append(strMenu);
									});
							
							},
							
							error:function(request, status, error){
						        alert("메인 메뉴 그리다 에러 발생");
						     }
							
						});
					},
	
	ajaxSubCallFn : function(options) {

			var settings = {

							url : "plus.do",
							FCGubun : "c",
							iMenuId: ""
					}

					settings = $.extend({}, settings, options);

					var subMenu = "";

			$.ajax({

					        type       		: 	"POST",
					        url       		: 	settings.url,
					        data	   		: 	{"iMenuId" : settings.iMenuId},
					        async      	: 	false,
					        
					        success     : 	function(result) {
					        	
					        	var jsonRes = JSON.parse(result);
					        	console.log(jsonRes);
					        	
					        		
									$.each(jsonRes , function (i, item){
										
										subMenu += '<li  id="menu' + item.iMenuId + '">'
										                            + '<a href="#" onclick="javascript:left.pageSubmitFn(\'menu' + item.IMenuId + '\',\'' + item.iMenuUrl + '\',\'' + item.iMenuNm + '\',\'1\')">'
										                               	+  item.iMenuNm 
										                           + '</a>'
										                        + '</li>';
											
										                        
									}); 
									
							},
							
							error:function(request, status, error){
						        alert("서브 메뉴 콜에서 ajaxSubCallFn 에서 에러 발생");
						     }
							
						}); 
							return subMenu;
						}
		}



$(document).ready(function() {	

	

left.findMainMenuFn();
	

var pageName = "<c:out value="${param.pageName}"/>";

$("[prop=menu]").removeClass("active");

$("#"+pageName).addClass("active");

if(pageName == ""){
	
	$("#main").addClass("active");
}else{
	
	$("#"+pageName).addClass("active");
}
});
	
	
	
	
	
</script>

<form id="frm" name="frm">
	<input type="hidden" id="pageName"  	name="pageName" />
	<input type="hidden" id="productId"  	name="productId" />
	<input type="hidden" id="productNm"  	name="productNm" />
	<input type="hidden" id="level"  	name="level" />
	<input type="hidden" id="Cusid"  	name="Cusid" value="${id}" />
	<input type="hidden" id="productId"  	name="productId" />
	<input type="hidden" id="eventId"  	name="eventId" />
	<input type="hidden" id="eventTt"  	name="eventTt" />
</form>


<div class="header header-sticky">
			<div class="container">
				<div class="header-wrapper clearfix">
					<!-- Navigation -->
					<nav class="navigation closed clearfix" >
						<a href="#" class="menu-toggle-close btn"><i class="fa fa-times"></i></a>
							<ul class="sf-menu nav" id="targetMenu">
							</ul>
					
					</nav>
					<!-- /Navigation -->
				</div>
			</div>
        </div>