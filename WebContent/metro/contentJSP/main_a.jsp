<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>Dashboard-manager</title>
<div class="content">
	<div class="mainbar">
		<div class="page-head">
			<h2 class="pull-left">
				Dashboard
				<span class="page-meta">ADMIN 페이지 입니다</span>
			</h2>
			<div class="bread-crumb pull-right">
				<a href="index.jsp"><i class="fa fa-home"></i> Home</a>
				<span class="divider">/</span> <a href="#" class="bread-current">Dashboard</a>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="matter">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<ul class="today-datas">
							<li class="bf5b351">
								<div class="pull-left">
									<span id="todayspark1" class="spark"></span>
								</div> 
								<div class="datas-text pull-right">
									<span class="bold">12,000</span> Visitors/Day
								</div>

								<div class="clearfix"></div>
							</li>
							<a href="#">
								<li class="bf5b351">
									<div class="pull-left">
										<i class="fa fa-group"></i>
									</div> 
									<div class="datas-text pull-right">
										<span class="bold">직원관리</span> 바로가기
									</div>

									<div class="clearfix"></div>
							</li>
							</a>
							<li class="bf5b351">
								<div class="pull-left">
									<span id="todayspark2" class="spark"></span>
								</div> 
								<div class="datas-text pull-right">
									<span class="bold">15.66%</span> Bounce Rate
								</div>

								<div class="clearfix"></div>
							</li>
							<li class="bf5b351">
								<div class="pull-left">
									<span id="todayspark3" class="spark"></span>
								</div> 
								<div class="datas-text pull-right">
									<span class="bold">$22,000</span> Total Profit
								</div>

								<div class="clearfix"></div>
							</li>
						</ul>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="widget w597484">
							<div class="widget-head">
								<div class="pull-left">상품관리</div>
								<div class="widget-icons pull-right">
									<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
									<a href="#" class="wclose"><i class="fa fa-times"></i></a>
								</div>
								<div class="clearfix"></div>
							</div>

							<div class="widget-content referrer">
								<table class="table  table-bordered ">
									<tr>
										<th><center>#</center></th>
										<th>Browsers</th>
										<th>Visits</th>
									</tr>
									<tr>
										<td><img
											src="<%=request.getContextPath()%>/metro/img/icons/chrome.png"
											alt="" /></td>
										<td>Google Chrome</td>
										<td>3,005</td>
									</tr>
									<tr>
										<td><img
											src="<%=request.getContextPath()%>/metro/img/icons/firefox.png"
											alt="" /></td>
										<td>Mozilla Firefox</td>
										<td>2,505</td>
									</tr>
									<tr>
										<td><img
											src="<%=request.getContextPath()%>/metro/img/icons/ie.png"
											alt="" /></td>
										<td>Internet Explorer</td>
										<td>1,405</td>
									</tr>
									<tr>
										<td><img
											src="<%=request.getContextPath()%>/metro/img/icons/opera.png"
											alt="" /></td>
										<td>Opera</td>
										<td>4,005</td>
									</tr>
									<tr>
										<td><img
											src="<%=request.getContextPath()%>/metro/img/icons/safari.png"
											alt="" /></td>
										<td>Safari</td>
										<td>505</td>
									</tr>
								</table>
							</div>
							<div class="widget-foot"></div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="widget w597484">
							<div class="widget-head">
								<div class="pull-left">빠른직원등록</div>
								<div class="widget-icons pull-right">
									<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
									<a href="#" class="wclose"><i class="fa fa-times"></i></a>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="widget-content">
								<div class="padd">
									<div class="form quick-post">
										<form class="form-horizontal">
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
											<div class="form-group">
												<label class="control-label col-lg-3" for="title">Title</label>
												<div class="col-lg-9">
													<input type="text" class="form-control" id="title">
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-lg-3" for="content">Content</label>
												<div class="col-lg-9">
													<textarea class="form-control" id="content"></textarea>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-lg-3" for="tags">Tags</label>
												<div class="col-lg-9">
													<input type="text" class="form-control" id="tags">
												</div>
											</div>
											<div class="form-group">
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
				<div class="row">
					<div class="col-md-8">
						<div class="widget w435256">
							<div class="widget-head">
								<div class="pull-left">Dashboard</div>
								<div class="widget-icons pull-right">
									<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
									<a href="#" class="wclose"><i class="fa fa-times"></i></a>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="widget-content">
								<div class="padd">
									<div id="bar-chart"></div>
								</div>
							</div>
							<!-- Widget ends -->
						</div>
					</div>
					<div class="col-md-4">
						<div class="widget w435256">
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
								<ul class="project">
									<li>
										<p class="clearfix">
											<input value="check1" type="checkbox" class="p-input">
											<span class="p-heading">Hospital Management System</span>
										</p>
										<p class="p-meta">
											<span>Due : 26/2/2012 - 80% Done</span>
										</p> 
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
											<input value="check1" type="checkbox" class="p-input">
											<span class="p-heading">School Download System</span>
										</p>
										<p class="p-meta">
											<span>Due : 26/2/2012 - 80% Done</span>
										</p> 
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
											<input value="check1" type="checkbox" class="p-input">
											<span class="p-heading">Question and Answers Script</span>
										</p>
										<p class="p-meta">
											<span>Due : 26/2/2012 - 80% Done</span>
										</p> 
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
							<div class="widget-foot"></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="widget w597484">
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
					<div class="col-md-6">
						<div class="widget w597484">
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
									<div id="curve-chart"></div>
									<hr />
									<div id="hoverdata">
										Mouse hovers at (<span id="x">0</span>, <span id="y">0</span>).
										<span id="clickdata"></span>
									</div>
								</div>
							</div>
							<div class="widget-foot"></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="widget w435256">
							<div class="widget-head">
								<div class="pull-left">파트너관리</div>
								<div class="widget-icons pull-right">
									<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
									<a href="#" class="wclose"><i class="fa fa-times"></i></a>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="widget-content">
								<table class="table  table-bordered ">
									<tr>
										<td>Domain</td>
										<td>sitedomain.com</td>
									</tr>
									<tr>
										<td>IP Address</td>
										<td>192.425.2.4</td>
									</tr>
									<tr>
										<td>Disk Space</td>
										<td>600GB / 60000GB</td>
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
					<div class="col-md-4">
						<div class="widget w435256">
							<div class="widget-head">
								<div class="pull-left">Project</div>
								<div class="widget-icons pull-right">
									<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
									<a href="#" class="wclose"><i class="fa fa-times"></i></a>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="widget-content">
								<ul class="project">
									<li>
										<p class="clearfix">
											<input value="check1" type="checkbox" class="p-input">
											<span class="p-heading">Hospital Management System</span>
										</p>

										<p class="p-meta">
											<span>Due : 26/2/2012 - 80% Done</span>
										</p> 
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
											<input value="check1" type="checkbox" class="p-input">
											<span class="p-heading">School Download System</span>
										</p>

										<p class="p-meta">
											<span>Due : 26/2/2012 - 80% Done</span>
										</p>
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
											<input value="check1" type="checkbox" class="p-input">
											<span class="p-heading">Question and Answers Script</span>
										</p>
										<p class="p-meta">
											<span>Due : 26/2/2012 - 80% Done</span>
										</p> 
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
							<div class="widget-foot"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
</div>
<jsp:include page="/metro/common/chartScript.jsp" />
