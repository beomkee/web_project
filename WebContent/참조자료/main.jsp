<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Main content starts -->
<div class="content">
	<!-- Main bar -->
	<div class="mainbar">

		<!-- Page heading  이안에 div 지우면 모냥 이상해짐 -->
		<div class="page-head">
			<!-- Page heading -->
			<h2 class="pull-left">
				Admin 페이지
				<!-- page meta -->
				<span class="page-meta">IRELIA 패숀</span>
			</h2>
			<!-- Breadcrumb -->
			<div class="bread-crumb pull-right">
				<a href="index.html"><i class="fa fa-home"></i> Home</a>
				<!-- Divider -->
			</div>
			<div class="clearfix"></div>
		</div>
		<!--/ Page heading ends -->




		<!-- Matter -->
		<div class="matter">
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<div class="widget wred">
							<div class="widget-head">
								<div class="pull-left">오늘의 할일</div>
								<div class="clearfix"></div>
							</div>
							<div class="widget-content">
								<div class="table-responsive">
									<table class="table table-bordered ">
										<thead>
											<tr>
												<th scope="col">입금전</th>
												<th scope="col">상품준비중/<br>배송보류중
												</th>
												<th scope="col">배송준비중</th>
												<th scope="col">배송대기</th>
												<th scope="col">배송중</th>
												<th scope="col">취소신청/<br>취소처리중
												</th>
												<th scope="col">교환신청/<br>교환처리중
												</th>
												<th scope="col">반품신청/<br>반품처리중
												</th>
												<th scope="col">환불전</th>
												<th scope="col">게시물 관리</th>
											</tr>
										</thead>
										<tbody class="center">
											<tr class="total">
												<td><a><strong><span id="">0</span></strong></a> 건</td>
												<td><a href=><strong><span id="">0</span></strong></a>	건 / <a href=><strong><span id="">0</span></strong></a> 건</td>
												<td><a href=""><strong><span id="">0</span></strong></a>	건</td>
												<td><a href=><strong><span id="">0</span></strong></a>	건</td>
												<td><a href=""><strong><span id="">0</span></strong></a>건</td>
												<td><a href=""><strong><span id="">0</span></strong></a>	건 / <a href=""><strong><span id="">0</span></strong></a> 건</td>
												<td><a href=""><strong><span id="">0</span></strong></a>건	/ <a href=""><strong><span id="">0</span></strong></a> 건</td>
												<td><a href=""><strong><span id="">0</span></strong></a>건 	/ <a href=""><strong><span id="">0</span></strong></a> 건</td>
												<td><a href=""><strong><span id="">0</span></strong></a> 	건</td>
												<td><a href="#none" onclick="top.MenuAction.change('', '390', '', 'transformTreeNo');"><strong><span id="">1</span></strong></a> 건</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- 주문 관리 내용 끝 -->
							</div>
						</div>
					</div>

					<div class="col-md-4">
						<div class="widget wviolet">
							<!-- Widget title -->
							<div class="widget-head">
								<div class="pull-left">문의/답변관리</div>
								<div class="widget-icons pull-right">
									<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
								</div>
								<div class="clearfix"></div>
							</div>


							<div class="widget-content">
								<div class="table-responsive">
									<table class="table  table-bordered ">
										<tbody>
											<tr>
												<td><a href="#">상품 후기 </a></td>
												<td><a href="#"><strong><span id="">0</span></strong></a>
													건</td>
											</tr>


											<tr>
												<td><a href="#">상품 문의</a></td>
												<td><a href="#"><strong><span id="">0</span></strong></a>
													건</td>
											</tr>

											<tr>
												<td><a href="#">1 : 1 문의</a></td>
												<td><a href="#"><strong><span id="">0</span></strong></a>
													건</td>
											</tr>


										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>

				</div>


				<div class="row">

					<div class="col-md-5">
						<div class="table-title">
							<h4>
								<span>공지사항</span>
							</h4>
						</div>
						<div class="board-list-newest content list-unstyled reform"
							id="panel_board_noticeAPI">
							<ol class="">
								<li><a href="#"> 운영 정책 안내  </a> <span	class="pull-right">2017-07-24</span></li>
								<li><a href="#">새로운 아이템 등록안내 </a> <span	class="pull-right">2017-07-24</span></li>
								<li><a href="#">결제 오류 안내 </a> <span	class="pull-right">2017-07-19</span></li>
								<li><a href="#">여름 시즌 주문 폭주로 인한 배송 지연 안내</a> <span	class="pull-right">2017-07-13</span></li>
							</ol>
						</div>
					</div>


					<div class="col-md-4">
						<div class="table-title">
							<h4>
								<span>진행중인 이벤트</span>
							</h4>
						</div>
						<div class="board-list-newest content list-unstyled reform"
							id="panel_board_noticeAPI">
							<ul class="">
								<li><a href="">리뷰쓰고 포인트 받자!  </a> <span 	class="pull-right">2017-07-25</span></li>
								<li><a href="">여름맞이 할인  </a> <span 	class="pull-right">2017-07-21</span></li>
								<li><a href="">100번째단위 구매 고객 이벤트 </a> <span	class="pull-right">2017-07-21</span></li>
								<li><a href="">여름 상품 5만원 이상구매시 사은품 증정</a> <span	class="pull-right">2017-07-21</span></li>
							</ul>
						</div>
					</div>

<!-- iv class="row"> -->
							<div class="col-md-3">
								<div class="widget wgreen">
									<div class="widget-head">
									  <div class="pull-left">상품현황</div>
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
													  <th>전체 등록 상품</th>
													  <th>품절 상품</th>
													</tr>
												</thead>
												<tbody>
													<tr>
													  <td><a href="#">2</a>건</td>
													  <td><a href="#">2</a>건</td>
													</tr>                                                                
												</tbody>
											</table>
										</div>
									</div>
								</div>

								
							</div>
<!-- 						</div>row 닫음 -->

				</div>


				<div class="row">
				
				<div class="col-md-12">
								<div class="widget wblue">
									<div class="widget-head">
										<div class="pull-left">전체 주문 현황</div>
										<div class="clearfix"></div>
									</div>
									<div class="widget-content">
										<div class="table-responsive">
											<table class="table table-bordered ">
												<thead>
													<tr>
													  <th>전체 주문 상황</th>
													  <th>전체 입금 대기</th>
													  <th>전체 결제 완료</th>
													  <th>전체 상품 준비중</th>
													  <th>전체 배송중</th>
													  <th>전체 배송 완료</th>
													  <th>전체 구매 확정</th>
													  <th>전체 결제 중단/실패</th>
													</tr>
												</thead>
												<tbody>
													<tr>
													  <td><a href="#">70</a>건</td>
													  <td><a href="#">10</a>건</td>
													  <td><a href="#">10</a>건</td>
													  <td><a href="#">10</a>건</td>
													  <td><a href="#">10</a>건</td>
													  <td><a href="#">10</a>건</td>
													  <td><a href="#">10</a>건</td>
													  <td><a href="#">10</a>건</td>
													</tr>                                                                
												</tbody>
											</table><!-- 전체 주문 현황 테이블 끝. -->
										</div>
									</div><!-- 전체 주문 현황 콘텐츠 끝. -->
								</div>
							</div>
							
				<!-- <div class="col-md-12">
					<div class="widget wlightblue">

						<div class="widget-head">
							<div class="pull-left">매출 현황</div>
							<div class="widget-icons pull-right">
								<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
								<a href="#" class="wclose"><i class="fa fa-times"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>


						<div class="widget-content">
							<div class="padd">
								Barchart. jQuery Flot plugin used.
								<div id="bar-chart" style="padding: 0px; position: relative;">
									<canvas class="flot-base" width="1377" height="353"
										style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 1102px; height: 283px;"></canvas>
									<div class="flot-text"
										style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; font-size: smaller; color: rgb(84, 84, 84);">
										<div class="flot-x-axis flot-x1-axis xAxis x1Axis"
											style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;">
											<div class="flot-tick-label tickLabel"
												style="position: absolute; max-width: 137px; top: 261px; left: 14px; text-align: center;">2017-08-01</div>
											<div class="flot-tick-label tickLabel"
												style="position: absolute; max-width: 137px; top: 261px; left: 189px; text-align: center;">2017-08-06</div>
											<div class="flot-tick-label tickLabel"
												style="position: absolute; max-width: 137px; top: 261px; left: 361px; text-align: center;">2017-08-11</div>
											<div class="flot-tick-label tickLabel"
												style="position: absolute; max-width: 137px; top: 261px; left: 536px; text-align: center;">2017-08-16</div>
											<div class="flot-tick-label tickLabel"
												style="position: absolute; max-width: 137px; top: 261px; left: 710px; text-align: center;">2017-08-21</div>
											<div class="flot-tick-label tickLabel"
												style="position: absolute; max-width: 137px; top: 261px; left: 885px; text-align: center;">2017-08-26</div>
											<div class="flot-tick-label tickLabel"
												style="position: absolute; max-width: 137px; top: 261px; left: 1060px; text-align: center;">2017-08-30</div>
										</div>
										<div class="flot-y-axis flot-y1-axis yAxis y1Axis"
											style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;">
											<div class="flot-tick-label tickLabel"
												style="position: absolute; top: 245px; left: 6px; text-align: right;">0</div>
											<div class="flot-tick-label tickLabel"
												style="position: absolute; top: 204px; left: 0px; text-align: right;">100</div>
											<div class="flot-tick-label tickLabel"
												style="position: absolute; top: 163px; left: 0px; text-align: right;">200</div>
											<div class="flot-tick-label tickLabel"
												style="position: absolute; top: 123px; left: 0px; text-align: right;">300</div>
											<div class="flot-tick-label tickLabel"
												style="position: absolute; top: 82px; left: 0px; text-align: right;">400</div>
											<div class="flot-tick-label tickLabel"
												style="position: absolute; top: 41px; left: 0px; text-align: right;">500</div>
											<div class="flot-tick-label tickLabel"
												style="position: absolute; top: 0px; left: 0px; text-align: right;">600</div>
										</div>
									</div>
									<canvas class="flot-overlay" width="1377" height="353"
										style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 1102px; height: 283px;"></canvas>
								</div>

							</div>
						</div>
					</div>
				</div> -->
				</div>
			</div>
		</div>
	</div>
</div>

	<script type="text/javascript">

		</script>


	<div class="clearfix"></div>
