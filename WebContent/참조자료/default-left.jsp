<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	.sidebar .sidebar-inner .navi .soso ul .onle ul {display: none;}
	.sidebar .sidebar-inner .navi .soso .on {background-color: #333; color: #999;}
</style>

<script type="text/javascript">
	var menu = {
			
		pageSubmitFn : function(pageName, menuurl) {

			$("#pageName").val(pageName);

			$("#frm").attr("action", menuurl);

			$("#frm").submit();
		},
		
		findMainMenuFn : function() {
			
			ajaxCl.ajaxCallFn({url: "ireliaLeft.do",FCGubun: "F"});
		}
	}

	var ajaxCl = 
	{
		ajaxCallFn : function(options) {
			
			var that = this;
			
			var settings = {
					
				url: "plus.do",
				FCGubun: "F"
			}
			
			settings = $.extend({}, settings, options);
			
			$.ajax({
				
				type       : "POST",
		        url        : settings.url,
		        async      : false,
		        success    : function(result) {
		        	
		        	var jsonRes = JSON.parse(result);
		        	
		        	$.each(jsonRes, function(i, item){
						
		        		if(item.iCollapseYn == 'Y'){
							
							var strSubMenu = "";
							
								strSubMenu = that.ajaxSubCallFn({url: "ireliaLeft.do", FCGubun: "C", menuId: item.iMenuId});
							
							var strMenu2 = "";
							
								strMenu2 += '<li class="has_submenu '+item.iMenuColor+' soso" id="'+ item.iMenuId + '">' 
											   + '<a href="#">'
												  +	'<i class="' + item.iMenuClass + '"></i>' 
														 + item.iMenuNm 
											 	  +	'<span class="pull-right">'
													  +	'<i class="fa fa-angle-right"></i>'
												  +	'</span>'
										   	   + '</a>'
											   + '<ul>'	
													+ strSubMenu
											   + '</ul>'
										  + '</li>';
										 
							$("#targetMenu").append(strMenu2);
						}else{
							
							var strMenu = "";
										
								strMenu += '<li class="'+item.iMenuColor+'" id="'+ item.iMenuId + '">'
				                         	  + '<a href="#" onclick="javascript:menu.pageSubmitFn(\''+ item.iMenuId + '\',\'' + item.iMenuUrl + '\')">'
				                         		 + '<i class="' + item.iMenuClass + '"></i>'
				                         		 + item.iMenuNm
				                         	  +	'</a>'
				                         + '</li>';
				                     
			                $("#targetMenu").append(strMenu);
				            
						}
		             });
		         }
			});
		},
		
		ajaxSubCallFn : function(options) {

			var that = this;
			
			var settings = {

			url : "plus.do",
			FCGubun : "c",
			menuId: ""
			}

			settings = $.extend({}, settings, options);

			var subMenu = "";

			$.ajax({

			        type       : "POST",
			        url        : settings.url,
			        data	   : {"menuId" : settings.menuId},
			        async      : false,
			        success    : function(result) {
			        	
			        	var jsonRes = JSON.parse(result);
			    		
						$.each(jsonRes, function(i, item){
							
							if(item.iCollapseYn == 'Y'){
								
								var strSubMenu = "";
								
								strSubMenu = that.ajaxSubCallFn({url: "ireliaLeft.do", FCGubun: "C", menuId: item.iMenuId});
							
								subMenu +=	'<li class="onle" id="'+ item.iMenuId + '">' 
											   + '<a href="#">'
													 + item.iMenuNm 
												  +	'<i class="fa fa-angle-right" style="margin-left: 55px;"></i>'
										   	   + '</a>'
											   + '<ul>'	
													+ strSubMenu
											   + '</ul>'
										  + '</li>';
								
							}else{
								
								subMenu += '<li id="'+ item.iMenuId + '">'
					            		 	+ '<a href="#" onclick="javascript:menu.pageSubmitFn(\''+ item.iParentId + '\',\'' + item.iMenuUrl + '\')">'
					            		 		  +	item.iMenuNm
					            		 	+ '</a>'
					            	    +  '</li>';
					            
							}
						});
						
			        }
			 }); 
			
			return subMenu;
		}
	}	
	
	$(document).ready(function(){
        
		menu.findMainMenuFn();
		
		var pageName = "<c:out value="${param.pageName}"/>";
	      
        $("#"+pageName).addClass("current");
      
	        if(pageName == ""){
	         
	           $("#targetMenu li").eq(0).addClass("current");
	        }else{
	         
	           $("#"+pageName).addClass("current");
	        }
        
        /* $(".sidebar .sidebar-inner .navi .soso .onle > a").on("click",function(e){	// 이건 사용하던가??
           
        	e.preventDefault();
            if($(this).hasClass("on")) {
                이거..모륵
                $(this).siblings("ul").stop().slideUp(500);
                $(this).removeClass("on");
            }
             else {
                   
                 $(this).siblings("ul").stop().slideDown(500);
                 $(this).addClass("on");
            }
        }); */
    });
</script>

<form id="frm" name="frm">
	<input type="hidden" id="pageName" name="pageName" />
</form>

<div class="sidebar">
	
	<div class="sidebar-inner">
		<!-- Search form -->
		<div class="sidebar-widget">
			<form>
				<input type="text" class="form-control" placeholder="Search">
			</form>
		</div>
		
		<ul class="navi" id="targetMenu"></ul>
		
		<div class="sidebar-widget">
			
		</div>
	</div>
</div>
