<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    
<style>
     * {margin: 0px; padding: 0px;}
	ul {list-style: none;}
	a {text-decoration: none;}
	.mypagelistcover {width: 1150px; height: 170px; margin: 0 auto;}
    .mypagelistcover p {font-size: 16px; color: #444; margin-bottom: 30px; text-align: center;}
    .mypagelist {width: 1150px; height: 120px; border-top: 3px solid #111;}
    .mypagelist ul li {float: left; text-align: center; width: 33.333%; height: 56px; border: 1px solid #ddd; line-height: 28px; font-size: 15px; color: #111;}
    .mypagelist ul li:hover { background-color: #ff5555;}
    .mypagelist ul li:hover a {color: #fff;}
    .mypagelist ul li:hover span {color: #fff;}
    .mypagelist ul li:nth-child(3) {background-color: #ff5555;}
    .mypagelist ul li:nth-child(3) a {color: #fff;}
    .mypagelist ul li:nth-child(3) span {color: #fff;}
    .mypagelist ul span {font-size: 12px; color: #888;}
    .mypagelist ul .on {border-bottom: none;}
    .input-box8 .shopcount {width: 120px; height: 34px; margin-left: 370px; background-color: #fff; border: 1px solid #aaa; color: #666;}
    .input-box8 .shopcount:hover {background: #ff5555  ; border-color: #ff5555; color: #fff;}
    .input-box8 .delete {width: 100px; height: 34px; margin-left:152px; background-color: #fff; border: 1px solid #aaa; color: #666;}
    .input-box8 .delete:hover {background: #ff5555; border-color: #ff5555; color: #fff;}
    .input-box8 .checkouty {width: 120px; margin-left:5px; height: 34px; border:0px; background-color: #ff5555; color: #fff;}
    .input-box8 .checkouty:hover {background-color: #fff; border: 1px solid #aaa; color: #666;}
</style>

<script type="text/javascript">


//===================================== 아작스 이용 카트항목 삭제 함수 시작=================================
	
var deleteCart = function() {
	
	var loginId = '${id}',
		selectedProductId = $(":checkbox[name='checkedValue']:checked"),
		multiId = "";
	
	$(selectedProductId).each(function(){
		
		if(multiId != ""){
			
			multiId += ","+$(this).val();
		}else{
			
			multiId += $(this).val();
		}
	});
	
    $.ajax({                          

        type: "POST",
        url: "deleteCart.do",	
        data: {  "loginId" :loginId,
        		"multiId" : multiId },
        success: function(result) {  
        	console.log("result : "+result);
        	if(result=="deleteCartSuccess"){
        		
        		$(selectedProductId).each(function(){
        			$(this).parent().parent().html("");
        		});
        		/* $("#delevery").html("<c:out value="${deleveryPrice}" default="0" />"); */
        		// 삭제되면 가격정보 바뀌게 해야함
	        		
        	}  else{
        		alert("안지워짐..")
        	}
       }
    });
 };

//===================================== 카트항목 결제로 넘기는 함수 시작====================================
	
var go_check = function() {
	
	var temp = $(":checkbox[name='checkedValue']:checked").parent().parent(),
		loginId = '${id}',
		that = this;
	
	if( $(":checkbox[name='checkedValue']:checked").length == 0 ){
		  alert("결제할 항목을 선택해주세요.");
		}
		else if(temp.hasClass("even-soldout")){
			alert("품절상품은 주문 할 수 없습니다.");
		}else{
	
			var temp = $(":checkbox[name='checkedValue']:checked")
				,selectedCartId = "";
			
			$(temp).each(function(){
				
				if(selectedCartId != ""){
					
					selectedCartId += ","+$(this).val();
				}else{
					
					selectedCartId += $(this).val();
				}
			});
			
			var x = [];
			
			$("[name='checkedValue']:checked").each(function() {

				x.push($(this).val());
			})
			
			var y = new Array();
			
			$("[id*='qty']").each(function() {
				for(i in x){
					
					if(x[i] == $(this).attr("id").split('_')[1]){
			        	y.push($(this).val());
					}
			    }
				
			})
			
			var stock = "";
			
			for(i=0;i<y.length;i++){
				
				if(stock != ""){
					
					stock += ","+y[i];
				}else{
					stock += y[i];
				}
				
			}
			
			$("#productStock").val(stock);
			
			$("#selectedCartId").val(selectedCartId);
			
			$("#cusId").val(loginId);
			
			$("#goToCheck").attr("action", "check.do");	
			
			$("#goToCheck").submit(); 
			
			
			
			
		}
	}
	
//===================================== 전체 체크박스 선택/취소 함수 시작===================================
	
$(function(){ 
	
	$("#allCheck").click(function(){ 
		if($("#allCheck").prop("checked")) { 
 			$("input[type=checkbox]").prop("checked",true); 
		}else{ 
			$("input[type=checkbox]").prop("checked",false); 
			} 
	}) 
});

//===================================== 선택 상품 가격 표시 함수 시작===================================
	
var sum_price = function(checkbox) {
	
	var temp = $(":checkbox[name='checkedValue']:checked").parent().parent(),
	loginId = '${id}',
	that = this;
	
	if(temp.hasClass("even-soldout")){
		alert("품절상품은 주문 할 수 없습니다.");
	}else{

		var x = [];
		
		$("[name='checkedValue']:checked").each(function() {

			x.push($(this).val());
		})
		
		var y = new Array();
		
		$("[id*='qty']").each(function() {
			for(i in x){
				
				if(x[i] == $(this).attr("id").split('_')[1]){
		        	y.push($(this).val());
				}
		    }
			
		})
		
		var z = new Array();
		
		$("[id*='price']").each(function() {
			for(i in x){
				
				if(x[i] == $(this).attr("id").split('_')[1]){
					temp = $(this).text();
		        	z.push(temp.trim());
				}
		    }
			
		})
		var select_price = 0,
			dely = 0,
			dtp = 0;
			
		for(i in x){
			
			select_price += y[i]*parseInt(z[i]);
		}
		
		$("#total_price").children().children().text(select_price * 1000 + "원");
		
		if(select_price < 50){
			$("#delevery").children().children().text(2500+ "원");
			dely = 2500;
		}else{
			$("#delevery").children().children().text(0+ "원");
			dely = 0;
		}
		
		dtp = (select_price * 1000) + dely;
		$("#dtp").children().children().text(dtp+ "원");
	}
}
	

</script>

<form id="goToCheck" name="goToCheck" method="post"> 
	<input type="hidden"  name="selectedCartId" 	id="selectedCartId">
	<input type="hidden"  name="cusId" 	id="cusId" >
	<input type="hidden" name="productStock" id="productStock">
</form>

<!-- Content area -->
<div class="content-area">
	<section class="page-section breadcrumbs">
		<h2 class="hidden">breadcrumbs</h2>
		<div class="container">
			<ul class="breadcrumb">
				<li><a href="#"
					onclick="javascript:HeaderSticky.pageSubmitFn('main')">Home</a></li>
					<c:choose>
						<c:when test="${id != null }">
							<li class="active"><a href="#" onclick="javascript:HeaderSticky.pageSubmitFn('pulllist')">마이페이지</a></li>
						</c:when>
						<c:when test="${id == null}">
						</c:when>
					</c:choose>
				<li class="active">장바구니</li>
			</ul>
		</div>
	</section>
	<!-- /BREADCRUMBS -->
	<div class="container">
		<c:choose>
			<c:when test="${id != null }">
				<div class="mypagelistcover">
					<p>장바구니</p>
					<div class="mypagelist">
						<ul>
							<li class="on"><a href="#"
								onclick="javascript:HeaderSticky.pageSubmitFn('pulllist')">total
									orderlist<br>
								<span>전체 주문내역</span>
							</a></li>
							<li class="on"><a href="#"
								onclick="javascript:HeaderSticky.pageSubmitFn('myCash')">mileage<br>
								<span>적립금</span></a></li>
							<li class="on"><a href="#"
								onclick="javascript:HeaderSticky.pageSubmitFn('cartt')">cart<br>
								<span>장바구니</span></a></li>
							<li><a class="top-link-checkout" href="#"
								onclick="javascript:HeaderSticky.pageSubmitFn('wishlistt')">wishlist<br>
								<span>위시리스트</span></a></li>
							<li><a href="#"
								onclick="javascript:HeaderSticky.pageSubmitFn('mysystem')">my
									info<br>
								<span>내 정보</span>
							</a></li>
							<li><a href="#"
								onclick="javascript:HeaderSticky.pageSubmitFn('myq')">my
									inquiry<br>
								<span>내 문의내역</span>
							</a></li>
						</ul>
					</div>
				</div>
			</c:when>
			<c:when test="${id == null}">
			</c:when>
		</c:choose>
		<h2 class="hidden">content</h2>

		<div class="progress-cart progress-cart-height-edit">
			<div class="active media">
				<div class="heading-tittle">
					<span>01</span>
				</div>
				<div class="media-content">
					<span>장바구니</span>
				</div>
			</div>
			<div class="media">
				<div class="heading-tittle">
					<span>02</span>
				</div>
				<div class="media-content">
					<span>결제정보입력</span>
				</div>
			</div>
			<div class="media">
				<div class="heading-tittle">
					<span>03</span>
				</div>
				<div class="media-content">
					<span>결제완료</span>
				</div>
			</div>
		</div>

		<form method="post" action="#" name="Cart" id="Cart">
			<input type="hidden" value="dY32yUjLzvsBE0Bj" name="form_key">
			<table class="data-table cart-table" id="shopping-cart-table">
				<thead class="hidden-phone">
					<tr class="first last">
						<th class="a-center first" rowspan="1"><input type="checkbox" id ="allCheck"/></th>
						<th rowspan="1"></th>
						<th rowspan="1"><span class="nobr">상품정보</span></th>
						<th rowspan="1"><span class="nobr">옵션</span></th>
						<th colspan="1" class="a-center"><span class="nobr">가격</span>
						</th>
						<th colspan="1" class="a-center"><span class="nobr">적립금</span>
						</th>
						<th class="a-center" rowspan="1">수량</th>
					</tr>
				</thead>
				<tbody>
				
		<!--===================================== 디비에서 가져와 뿌려주는 부분 ============================================-->
					<c:forEach items="${cartItems}" var="cartItems" varStatus="status">
						<c:if test="${cartItems.productStock != 0}">
							<tr id="cartItems" class="first odd">
						</c:if>
						<c:if test="${cartItems.productStock == 0}">
							<tr class="last even-soldout" style="background-color: #f6f6f6">
						</c:if>

						<td class="a-center first"><input type="checkbox" id ="checkedValue" name="checkedValue" value="<c:out value="${cartItems.cartId}"/>" onClick="sum_price(this)" />
						</td>
						<td><img width="49" height="77"	src="images/preview/shop/<c:out value="${cartItems.productImg}"/>">
						</td>
						<td>
							<h2 class="product-name">
								<a href="#"	onclick="javascript:HeaderSticky.pageSubmitFn('shopDetail')"><c:out	value="${cartItems.productNm}" /></a>
							</h2>

						</td>
						<td>색상: <c:out value="${cartItems.colorNm}" /><br> 사이즈: <c:out value="${cartItems.sizeName}" />
						</td>
						<td class="a-left" id="price_<c:out value="${cartItems.cartId}"/>"><span class="cart-price"><span class="price" ><fmt:formatNumber value="${cartItems.productPrice}" pattern=" #,###" /></span>
						</span></td>
						<td><img src="images/noCheck.gif" />&nbsp;<c:out value="${cartItems.accountpoint}" />원<br> 
							<img src="images/card.gif" />&nbsp;<c:out value="${cartItems.cardpoint}" />원&nbsp;</td>
						<td class="a-center">
							<c:if test="${cartItems.productStock != 0}">
								<%-- <div class="custom-qty clearfix">
									<a href="javascript:void(0)" class="alo_qty alo_qty_dec"> <i class="fa fa-minus-square-o"></i>
									</a> <input maxlength="12" id="Qty" class="input-text qty" title="Qty"size="4" value="<c:out value="${cartItems.cartAmount}"/>"	> 
										<a 	class="alo_qty alo_qty_inc" > <i class="fa fa-plus-square-o"  onclick="var result = document.getElementById('Qty'); var qty = result.value;  if (!isNaN(Qty)) result.value++;return false;"></i>
									</a>
								</div> 원래 남아있던 것 --%>
								<div class="custom-qty clearfix">
                                   <button  type="button" class="alo_qty alo_qty_dec" onclick="var result = document.getElementById('qty_<c:out value="${cartItems.cartId}"/>');   var qty_<c:out value="${cartItems.cartId}"/> = result.value;  if (!isNaN(qty_<c:out value="${cartItems.cartId}"/>) && qty_<c:out value="${cartItems.cartId}"/> > 1)result.value--; return false;"> <i class="fa fa-minus-square-o"></i> </button> 
                                   <input type="text" name="qty" id="qty_<c:out value="${cartItems.cartId}"/>" maxlength="12" value="<c:out value="${cartItems.cartAmount}"/>" title="Qty" class="input-text qty" /> 
                                   <button  type="button" class="alo_qty alo_qty_inc" onclick="var result = document.getElementById('qty_<c:out value="${cartItems.cartId}"/>');   var qty_<c:out value="${cartItems.cartId}"/> = result.value;  if (!isNaN(qty_<c:out value="${cartItems.cartId}"/>)) result.value++;return false;"> <i class="fa fa-plus-square-o"></i> </button>
                                </div>
								<div id="stoctY">
									남은 수량 :
									<c:out value="${cartItems.sizeAfterCount}" />
								</div>
							</c:if> <c:if test="${cartItems.productStock == 0}">
								<div id="stoctN" style="color: #ff5555">품 절</div>
							</c:if></td>
						</tr>
							<c:set var="temp" value="${cartItems.productPrice}" />
							<c:set var="priceCount" value="${priceCount + temp}" />

					</c:forEach>
		<!--===================================== 디비에서 가져와 뿌려주는 부분 끝 ===========================================-->
		
				</tbody>
			</table>
			<p class="guide_txt">* 카트에 종료되거나 품절된 상품이 존재할 경우 구매를 진행 할 수 없습니다.</p>
			<table class="data-table cart-table" id="shopping-cart-table">
				<thead class="hidden-phone">
					<tr class="first last">
						<th rowspan="1" class="a-center" width="25%">
							<h4>총 상품금액</h4>
						</th>
						<th colspan="1" class="a-center" width="25%">
							<h4>배송비</h4>
						</th>
						<th colspan="1" class="a-center" width="50%">
							<h4>결제 예정금액</h4>
						</th>
					</tr>
				</thead>

				<tbody>
					<tr class="first odd">
					
			<!--================================  가격정보 뿌려주는 부분 시작 ====================================-->
						<td class="a-left a-subtotal" id="total_price"><span class="cart-price">
								<span class="price"><fmt:formatNumber value="0" pattern=" #,###" />원</span>
						</span></td>
						<td class="a-left a-subtotal" id="delevery"><span class="cart-price">
								<span class="price">+ <fmt:formatNumber  value="2500" pattern=" #,###" />원</span>
						</span></td>
						<td class="a-left a-subtotal" id="dtp"><span class="cart-price">
								<span class="price"> = <fmt:formatNumber value="0" pattern=" #,###"/>원</span>
						</span></td>
					</tr>
					
			<!--=================================  가격정보 뿌려주는 부분 끝 =====================================-->
			
				</tbody>
			</table>

			<div class="input-box8"	style="margin-left: 265px; margin-bottom: 20px; margin-top: 20px;">
				<input type="button" onclick="deleteCart();" class="delete" value="삭제 하기">
				<input type="button" onclick="go_check()" class="checkouty" value="결제 하기" /> 
				<input type="button" onclick="javascript:HeaderSticky.pageSubmitFn('shop')" class="shopcount" value="쇼핑 계속하기">
			</div>
		</form>

		<div class="pagination-wrapper">
			<ul class="pagination">
				<li class="disabled"><a href="#">«</a></li>
				<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>

				<li><a href="#">»</a></li>
			</ul>
		</div>
		<!-- /content -->
	</div>
</div>
