<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>Dashboard-employee</title>
<!-- Main content starts -->
<div class="content">
	<!-- Main bar -->
	<div class="mainbar">
		<!-- Page heading -->
		<div class="page-head">
			<!-- Page heading -->
			<h2 class="pull-left">
				Dashboard
				<!-- page meta -->
				<span class="page-meta">직원페이지입니다</span>
			</h2>
			<!-- Breadcrumb -->
			<div class="bread-crumb pull-right">
				<a href="index.jsp"><i class="fa fa-home"></i> Home</a>
				<!-- Divider -->
				<span class="divider">/</span> <a href="#" class="bread-current">Dashboard</a>
			</div>
			<div class="clearfix"></div>
		</div>
		<!--/ Page heading ends -->
		<!-- Matter -->
		<div class="matter">
			<div class="container">

				<!-- Today status. jQuery Sparkline plugin used. -->
				<div class="row">
					<div class="col-md-12">
						<!-- List starts -->
						<ul class="today-datas">
							<!-- List #1 -->
							<a href="#">
								<li class="bgreen">
									<!-- Graph -->
									<div class="pull-left">
										<i class="fa fa-group"></i>
									</div> <!-- Text -->
									<div class="datas-text pull-right">
										<span class="bold">내 정보</span> 바로가기
									</div>
									<div class="clearfix"></div>
							</li>
							</a>
							<li class="bgreen">
								<!-- Graph -->
								<div class="pull-left">
									<span id="todayspark1" class="spark"></span>
								</div> <!-- Text -->
								<div class="datas-text pull-right">
									<span class="bold">12,000</span> 재고현황
								</div>
								<div class="clearfix"></div>
							</li>
							<li class="bgreen">
								<!-- Graph -->
								<div class="pull-left">
									<span id="todayspark3" class="spark"></span>
								</div> <!-- Text -->
								<div class="datas-text pull-right">
									<span class="bold">85%</span> 목표달성률
								</div>
								<div class="clearfix"></div>
							</li>
							<li class="bgreen">
								<div class="pull-left">
									<span id="todayspark2" class="spark"></span>
								</div>
								<div class="datas-text pull-right">
									<span class="bold">15.66%</span> 월별 생산 추이
								</div>

								<div class="clearfix"></div>
							</li>
						</ul>
					</div>
				</div>
				<!--/ Today status ends -->
				<!-- Server Status -->
				<div class="row">
					<div class="col-md-4">
						<div class="widget wgray">
							<!-- Widget title -->
							<div class="widget-head">
								<div class="pull-left">내 정보</div>
								<div class="widget-icons pull-right">
									<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
									<a href="#" class="wclose"><i class="fa fa-times"></i></a>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="widget-content">
								<!-- Widget content -->

								<table class="table  table-bordered ">
									<tr>
										<td>이름</td>
										<td>박성범</td>
									</tr>
									<tr>
										<td>부서</td>
										<td>H-Line 개발</td>
									</tr>
									<tr>
										<td>직급</td>
										<td>사원</td>
									</tr>
									<tr>
										<td>Bandwidth</td>
										<td>1000GB / 2000GB</td>
									</tr>
									<tr>
										<td>PHP Version</td>
										<td>5.1.1</td>
									</tr>
									<tr>
										<td>MySQL Databases</td>
										<td>10</td>
									</tr>
								</table>

							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="widget wgray">
							<div class="widget-head">
								<div class="pull-left">빠른 입력</div>
								<div class="widget-icons pull-right">
									<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
									<a href="#" class="wclose"><i class="fa fa-times"></i></a>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="widget-content">
								<div class="padd">
									<div class="form quick-post">
										<!-- Edit profile form (not working)-->
										<form class="form-horizontal">
											<!-- Cateogry -->
											<div class="form-group">
												<label class="control-label col-lg-3">Category</label>
												<div class="col-lg-9">
													<select class="form-control">
														<option value="">- Choose Cateogry -</option>
														<option value="1">General</option>
														<option value="2">News</option>
														<option value="3">Media</option>
														<option value="4">Funny</option>
													</select>
												</div>
											</div>                                                    
											<!-- Title -->
											<div class="form-group">
												<label class="control-label col-lg-3" for="title">Title</label>
												<div class="col-lg-9">
													<input type="text" class="form-control" id="title">
												</div>
											</div>
											<!-- Content -->
											<div class="form-group">
												<label class="control-label col-lg-3" for="content">Content</label>
												<div class="col-lg-9">
													<textarea class="form-control" id="content"></textarea>
												</div>
											</div>
											
											<!-- Tags -->
											<div class="form-group">
												<label class="control-label col-lg-3" for="tags">Tags</label>
												<div class="col-lg-9">
													<input type="text" class="form-control" id="tags">
												</div>
											</div>

											<!-- Buttons -->
											<div class="form-group">
												<!-- Buttons -->
												<div class="col-lg-offset-3 col-lg-9">
													<button type="submit" class="btn btn-success">Publish</button>
													<button type="submit" class="btn btn-success">Save
														Draft</button>
													<button type="reset" class="btn btn-default">Reset</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Project widget -->
				<div class="row">
					<div class="col-md-4">
						<div class="widget wgray2">
							<!-- Widget title -->
							<div class="widget-head">
								<div class="pull-left">Project</div>
								<div class="widget-icons pull-right">
									<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
									<a href="#" class="wclose"><i class="fa fa-times"></i></a>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="widget-content">
								<!-- Widget content -->
								<!-- Task list starts -->
								<ul class="project">
									<li>
										<p class="clearfix">
											<!-- Checkbox -->
											<input value="check1" type="checkbox" class="p-input">
											<!-- Name -->
											<span class="p-heading">Hospital Management System</span>
										</p>
										<p class="p-meta">
											<!-- Due date & % Completed -->
											<span>Due : 26/2/2012 - 80% Done</span>
										</p> <!-- Progress bar -->
										<div class="progress progress-striped active">
											<div class="progress-bar progress-bar-info"
												role="progressbar" aria-valuenow="100" aria-valuemin="0"
												aria-valuemax="100" style="width: 80%">
												<span class="sr-only">80% Complete</span>
											</div>
										</div>
									</li>
									<li>
										<p class="clearfix">
											<!-- Checkbox -->
											<input value="check1" type="checkbox" class="p-input">
											<!-- Name -->
											<span class="p-heading">School Download System</span>
										</p>

										<p class="p-meta">
											<!-- Due date & % Completed -->
											<span>Due : 26/2/2012 - 80% Done</span>
										</p> <!-- Progress bar -->
										<div class="progress progress-striped active">
											<div class="progress-bar progress-bar-warning"
												role="progressbar" aria-valuenow="100" aria-valuemin="0"
												aria-valuemax="100" style="width: 90%">
												<span class="sr-only">90% Complete</span>
											</div>
										</div>
									</li>
									<li>
										<p class="clearfix">
											<!-- Checkbox -->
											<input value="check1" type="checkbox" class="p-input">
											<!-- Name -->
											<span class="p-heading">Question and Answers Script</span>
										</p>
										<p class="p-meta">
											<!-- Due date & % Completed -->
											<span>Due : 26/2/2012 - 80% Done</span>
										</p> <!-- Progress bar -->
										<div class="progress progress-striped active">
											<div class="progress-bar progress-bar-danger"
												role="progressbar" aria-valuenow="100" aria-valuemin="0"
												aria-valuemax="100" style="width: 70%">
												<span class="sr-only">70% Complete</span>
											</div>
										</div>
									</li>
								</ul>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="widget wgray2">
								<div class="widget-head">
									<div class="pull-left">Curve Chart</div>
									<div class="widget-icons pull-right">
										<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
										<a href="#" class="wclose"><i class="fa fa-times"></i></a>
									</div>
									<div class="clearfix"></div>
								</div>

								<div class="widget-content">
									<div class="padd">

										<!-- Curve chart -->

										<div id="curve-chart"></div>

										<hr />
										<!-- Hover location -->
										<div id="hoverdata">
											Mouse hovers at (<span id="x">0</span>, <span id="y">0</span>).
											<span id="clickdata"></span>
										</div>

										<!-- Skil this line. <div class="uni"><input id="enableTooltip" type="checkbox">Enable tooltip</div> -->

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 3번째 줄 -->
				<div class="row">
					<div class="col-md-4">
						<div class="widget wgray">
							<div class="widget-head">
								<div class="pull-left">Today Status</div>
								<div class="widget-icons pull-right">
									<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
									<a href="#" class="wclose"><i class="fa fa-times"></i></a>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="widget-content">
								<div class="padd">

									<!-- Visitors, pageview, bounce rate, etc., Sparklines plugin used -->
									<ul class="current-status">
										<li><span id="status1"></span> <span class="bold">Visits
												: 2000</span> <i class="fa fa-arrow-up green"></i></li>
										<li><span id="status2"></span> <span class="bold">Unique
												Visitors : 1,345</span> <i class="fa fa-arrow-down red"></i></li>
										<li><span id="status3"></span> <span class="bold">Pageviews
												: 2000</span> <i class="fa fa-arrow-up green"></i></li>
										<li><span id="status4"></span> <span class="bold">Pages
												/ Visit : 2000</span> <i class="fa fa-arrow-down red"></i></li>
										<li><span id="status5"></span> <span class="bold">Avg.
												Visit Duration : 2000</span> <i class="fa fa-arrow-down red"></i></li>
										<li><span id="status6"></span> <span class="bold">Bounce
												Rate : 2000</span> <i class="fa fa-arrow-up green"></i></li>
										<li><span id="status7"></span> <span class="bold">%
												New Visits : 2000</span> <i class="fa fa-arrow-up green"></i></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-8">
						<!-- Widget -->
						<div class="widget wgray">
							<!-- Widget head -->
							<div class="widget-head">
								<div class="pull-left">Dashboard</div>
								<div class="widget-icons pull-right">
									<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
									<a href="#" class="wclose"><i class="fa fa-times"></i></a>
								</div>
								<div class="clearfix"></div>
							</div>
							<!-- Widget content -->
							<div class="widget-content">
								<div class="padd">
									<!-- Bar chart (Blue color). jQuery Flot plugin used. -->
									<div id="bar-chart"></div>
								</div>
							</div>
							<!-- Widget ends -->
						</div>
					</div>
				</div>
				<!-- Dashboard graph ends -->
			</div>
		</div>
		<!--/ Matter ends -->
	</div>
	<!--/ Mainbar ends -->
	<div class="clearfix"></div>
</div>
<!--/ Content ends -->
