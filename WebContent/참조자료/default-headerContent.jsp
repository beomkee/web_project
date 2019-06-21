<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
	<style>
	
		#searchKind{
		    height: 38px;
		    left: 0;
		    line-height: 38px;
		    outline: none;
		    overflow: hidden;
		    text-indent: 10px;
		    top: 0;
		    width: 80px;
		}
		
		.content-seach-right{width:auto;height:auto;float:right;padding:0;margin:80px 15px 0 0;}
	</style>
	
	<script>
		var HeaderContent = 
		{
			pageSubmitFn : function(pageName) {
				
				$("#search_mini_form").attr("action", pageName+".do");	
							
				$("#search_mini_form").submit();
			}
		};
	</script>
	
	<header class="header">
		<div class="header-content">
			<div class="container">
				<div class="row">
					<div class="content-seach col-md-4 col-sm-4 col-xs-12">
						<div class="header-search">
							<form method="get" id="search_mini_form">
								<div class="form-search clearfix">
									<input type="search" placeholder="Search" maxlength="128" class="input-text required-entry" value="" name="searchContent" id="searchContent" autocomplete="off">
									<button class="button" title="Search" type="submit" onclick="javascript:HeaderContent.pageSubmitFn('shopSearch')"><span><span><i aria-hidden="true" data-icon="U" class="fs1"></i></span></span></button>
								</div>
							</form>
						</div>
					</div>
					<div class="content-logo col-md-4 col-sm-4 col-xs-12">
						<div class="header-logo">
							<h1 class="logo" id="main">
								<a href="#" onclick="javascript:HeaderSticky.pageSubmitFn('main')" class="scroll-to"><img alt="ALO Themes" src="images/logo/logo.png" class="img-responsive"></a>
							</h1>
						</div>
					</div>
					
				<div>
					<c:choose>
						<c:when test="${id != null}">

							<div class="content-seach-right col-md-4 col-sm-4 col-xs-12">
							${name} 님의 현재 적립금 : ${point}
							</div>
							
						</c:when>
						<c:when test="${id == null}">
								<div class="content-seach-right col-md-4 col-sm-4 col-xs-12">
								<a href="#" onclick="javascript:HeaderSticky.pageSubmitFn('register')">
								지금 가입하시면 더 많은 혜택을 받으실수 있습니다!
								</a>
							</div>

						</c:when>
					</c:choose>
			</div>


<!-- 								원래있던 미니 카트  -->
<!-- 					<div class="content-cart menu-mobile col-md-4 col-sm-4 col-xs-12"> -->
<!-- 						Mobile menu toggle button -->
<!-- 						<a href="#" class="menu-toggle btn"><i class="fa fa-bars"></i></a> -->
<!-- 						/Mobile menu toggle button -->
<!-- 						<div class="miniCartWrap pull-right"> -->
<!-- 							<div class="mini-maincart"> -->
<!-- 								<div class="cartSummary"> -->
<!-- 									<div class="crat-icon"> -->
<!-- 										<span class="icon_cart_alt"></span> -->
<!-- 										<span class="zero">2 </span> -->
<!-- 										<p class="mt-cart-title">My Cart</p> -->
<!-- 									</div> -->
<!-- 									<div class="cart-header"> -->
<!-- 										<p class="cart-tolatl"> -->
<!-- 											<span><span class="price">36700 won</span></span> -->
<!-- 										</p> -->
<!-- 									</div>	 -->
<!-- 								</div> -->
<!-- 								<div class="mini-contentCart"> -->
<!-- 									<div class="block-content"> -->
<!-- 										<p class="block-subtitle">최근에 담은 상품들</p> -->
<!-- 										<ol class="mini-products-list clearfix" id="cart-sidebar"> -->
<!-- 											<li class="item clearfix"> -->
<!-- 												<div class="cart-content-top"> -->
<!-- 													<a class="product-image" title="Wave Ripped Straight" href="#"> -->
<!-- 														<img width="60" height="77" alt="Wave Ripped Straight" src="images/preview/partners/end1.jpg"> -->
<!-- 													</a> -->
<!-- 													<div class="product-details"> -->
<!-- 													<p class="product-name"><a href="#" onclick="javascript:HeaderSticky.pageSubmitFn('cartt')">눈부신 팔찌</a></p> -->
<!-- 													<span class="price">36700 won</span> x <strong>1</strong>                              -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 												<div class="cart-content-bottom"> -->
<!-- 													<div class="clearfix"> -->
<!-- 														<a class="btn-remove btn-remove2" title="Remove" href="#"><i class="icon-close icons"></i></a> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</li> -->
<!-- 											<li class="item clearfix"> -->
<!-- 												<div class="cart-content-top"> -->
<!-- 													<a class="product-image" title="Wave Ripped Straight" href="#"> -->
<!-- 														<img width="60" height="77" alt="Wave Ripped Straight" src="images/preview/partners/end2.jpg"> -->
<!-- 													</a> -->
<!-- 													<div class="product-details"> -->
<!-- 													<p class="product-name"><a href="#" onclick="javascript:HeaderSticky.pageSubmitFn('cartt')">골든 듀</a></p> -->
<!-- 													 <span class="price">36700 won</span> x <strong>1</strong>                               -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 												<div class="cart-content-bottom"> -->
<!-- 													<div class="clearfix"> -->
<!-- 														<a class="btn-remove btn-remove2" title="Remove" href="#"><i class="icon-close icons"></i></a> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</li> -->
<!-- 										</ol> -->
<!-- 										<p class="subtotal"> -->
<!-- 											<span class="label">Subtotal:</span> <span class="price">73400 won</span> -->
<!-- 										</p> -->
<!-- 										<div class="actions"> -->
<!-- 											<a class="view-cart"  href="#" onclick="javascript:HeaderSticky.pageSubmitFn('cartt')">View cart  </a> -->
<!-- 											<a  class="checkout btn-call-checkout" href="#" onclick="javascript:HeaderSticky.pageSubmitFn('check')">Checkout </a> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
    </header>