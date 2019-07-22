<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>직원 메인</title>
<div class="dashboard-wrapper">
	<div class="influence-profile">
		<div class="container-fluid dashboard-content ">
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="page-header">
						<h3 class="mb-2">${user.name}'sDashBoard</h3>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-3 col-lg-3 col-md-5 col-sm-12 col-12">
					<div class="card">
						<div class="card-body">
							<div class="user-avatar text-center d-block">
								<img src="<%=request.getContextPath()%>/concept-master/img/user/${LOGINED_ID}.jpg" alt="User Avatar" class="rounded-circle user-avatar-xxl">
							</div>
							<div class="text-center">
								<h2 class="font-24 mb-0">${user.name}</h2>
								<p>${user.f_num}&nbsp;-&nbsp;${user.pl_num}</p>
							</div>
						</div>
						<div class="card-body border-top">
							<div class="">
								<ul class="list-unstyled mb-0">
									<li class="mb-2"><i class="fas fa-fw fa-envelope mr-2"></i>${user.email}</li>
									<li class="mb-0"><i class="fas fa-fw fa-phone mr-2"></i>${user.tel}</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-9 col-lg-9 col-md-7 col-sm-12 col-12">
					<div class="influence-profile-content pills-regular">
						<ul class="nav nav-pills mb-3 nav-justified" id="pills-tab" role="tablist">
							<li class="nav-item"><a class="nav-link active" id="pills-campaign-tab" data-toggle="pill" href="#pills-campaign" role="tab"
								aria-controls="pills-campaign" aria-selected="true"
							>전체요약</a></li>
							<li class="nav-item"><a class="nav-link" id="pills-packages-tab" data-toggle="pill" href="#pills-packages" role="tab"
								aria-controls="pills-packages" aria-selected="false"
							>개인업무현황</a></li>
							<li class="nav-item"><a class="nav-link" id="pills-review-tab" data-toggle="pill" href="#pills-review" role="tab"
								aria-controls="pills-review" aria-selected="false"
							>간편입력</a></li>
							<li class="nav-item"><a class="nav-link" id="pills-msg-tab" data-toggle="pill" href="#pills-msg" role="tab" aria-controls="pills-msg"
								aria-selected="false"
							>EMAIL</a></li>
						</ul>
						<div class="tab-content" id="pills-tabContent">
							<div class="tab-pane fade show active" id="pills-campaign" role="tabpanel" aria-labelledby="pills-campaign-tab">
								<div class="row">
									<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
										<div class="section-block">
											<h3 class="section-title">한눈에 보기</h3>
										</div>
									</div>
									<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
										<div class="card">
											<div class="card-body">
												<h1 class="mb-1">9</h1>
												<p>
													진행중인<br>[&nbsp;]
												</p>
											</div>
										</div>
									</div>
									<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
										<div class="card">
											<div class="card-body">
												<h1 class="mb-1">35</h1>
												<p>
													[&nbsp;]<br> 관리
												</p>
											</div>
										</div>
									</div>
									<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
										<div class="card">
											<div class="card-body">
												<h1 class="mb-1">8</h1>
												<p>
													읽지않은<br>EMAIL
												</p>
											</div>
										</div>
									</div>
									<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
										<div class="card">
											<div class="card-body">
												<h1 class="mb-1">${lastNotice}</h1>
												<p>
													최근<br>공지사항
												</p>
											</div>
										</div>
									</div>
								</div>
								<div class="section-block">
									<h3 class="section-title">요약정보</h3>
								</div>
								<!-- =========== 이메일 요약 =========== -->
								<!-- <div class="card">
									<div class="card-body">
										<div class="row">
											<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
												<div class="media influencer-profile-data d-flex align-items-center p-2">
													<div class="media-body ">
														<div class="influencer-profile-data">
															<h3 class="m-b-10">읽지 않은 EMAIL</h3>
															<p>
																<span class="m-r-20 text-info">최근 3개의 이메일만 표시됩니다 </span>
															</p>
														</div>
													</div>
												</div>
											</div>
										</div>
										<hr>
									</div>
									<div class="email-list-item email-list-item--unread">
										<div class="email-list-actions"></div>
										<div class="email-list-detail">
											<span class="date float-right"></span><span class="date float-right"> <span class="icon"></span> 13 Jul
											</span> <span class="from">이승주</span>
											<p class="msg">Urgent - You forgot your keys in the class room, please come imediatly!</p>
										</div>
									</div>
									<div class="email-list-item email-list-item--unread">
										<div class="email-list-actions"></div>
										<div class="email-list-detail">
											<span class="date float-right"></span><span class="date float-right"> <span class="icon"><i class="fas fa-paperclip"></i></span> 13
												Jul
											</span> <span class="from">김현중</span>
											<p class="msg">Urgent - You forgot your keys in the class room, please come imediatly!</p>
										</div>
									</div>
									<div class="email-list-item email-list-item--unread">
										<div class="email-list-actions"></div>
										<div class="email-list-detail">
											<span class="date float-right"></span><span class="date float-right"> <span class="icon"></span> 13 Jul
											</span> <span class="from">김주호</span>
											<p class="msg">Urgent - You forgot your keys in the class room, please come imediatly!</p>
										</div>
									</div>
								</div> -->
								<!-- =========== 공지 요약 =========== -->
								<div class="card">
									<div class="card-body">
										<div class="row">
											<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
												<div class="media influencer-profile-data d-flex align-items-center p-2">
													<div class="media-body">
														<h3 class="m-b-10">최근 공지 사항</h3>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="border-top card-footer p-0">
										<table class="table">
											<tbody>
												<c:forEach var="notice" items="${notices}">
													<tr>
														<th scope="row">${notice.n_num }</th>
														<td>
															<a href="<%=request.getContextPath() %>/notice/nContent.do?nNum=${notice.n_num}&pageNum=1">${notice.title}</a>
														</td>
														<td style="text-align: center">${notice.mod_date}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								<!-- =========== 업무 요약 =========== -->
								<div class="card">
									<div class="card-body">
										<div class="row">
											<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
												<div class="media influencer-profile-data d-flex align-items-center p-2">
													<div class="media-body">
														<h3 class="m-b-10">최근 업무</h3>
														<p>
															<span class="m-r-20 d-inline-block">Draft Due Date<span class="m-l-10 d-inline-block text-primary">28 Jan 2018</span></span><span
																class="m-r-20 d-inline-block"
															> Publish Date<span class="m-l-10 text-secondary">20 March 2018</span></span><span class="m-r-20">Ends<span class="m-l-10 text-info">10
																	July, 2018</span></span>
														</p>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="border-top card-footer p-0">
										<div class="campaign-metrics d-xl-inline-block">
											<h4 class="mb-0 ">35k</h4>
											<p>Total Reach</p>
										</div>
										<div class="campaign-metrics d-xl-inline-block">
											<h4 class="mb-0 ">45k</h4>
											<p>Total Views</p>
										</div>
										<div class="campaign-metrics d-xl-inline-block">
											<h4 class="mb-0">8k</h4>
											<p>Total Click</p>
										</div>
										<div class="campaign-metrics d-xl-inline-block">
											<h4 class="mb-0 ">10k</h4>
											<p>Engagement</p>
										</div>
										<div class="campaign-metrics d-xl-inline-block">
											<h4 class="mb-0">3k</h4>
											<p>Conversion</p>
										</div>
									</div>
								</div>
								<!-- =========== 관리 요약 =========== -->
								<div class="card">
									<div class="card-body">
										<div class="row">
											<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
												<div class="media influencer-profile-data d-flex align-items-center p-2">
													<div class="media-body">
														<h3 class="m-b-10">[&nbsp;] 관리</h3>
														<p>
															<span class="m-r-20 d-inline-block">Draft Due Date <span class="m-l-10 text-primary">05 Feb 2018</span></span> <span
																class="m-r-20 d-inline-block"
															> Publish Date <span class="m-l-10 text-secondary">14 May 2018</span></span><span class="m-r-20 d-inline-block">Ends<span
																class="m-l-10 text-info"
															>16 Aug, 2018</span></span>
														</p>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="border-top card-footer p-0">
										<div class="campaign-metrics d-xl-inline-block">
											<h4 class="mb-0">40k</h4>
											<p>Total Reach</p>
										</div>
										<div class="campaign-metrics d-xl-inline-block">
											<h4 class="mb-0 ">35k</h4>
											<p>Total Views</p>
										</div>
										<div class="campaign-metrics d-xl-inline-block">
											<h4 class="mb-0">5k</h4>
											<p>Total Click</p>
										</div>
										<div class="campaign-metrics d-xl-inline-block">
											<h4 class="mb-0">15k</h4>
											<p>Engagement</p>
										</div>
										<div class="campaign-metrics d-xl-inline-block">
											<h4 class="mb-0">14k</h4>
											<p>Conversion</p>
										</div>
									</div>
								</div>
							</div>
							<!-- ======================================== 업무 세부 ============================================ -->
							<div class="tab-pane fade" id="pills-packages" role="tabpanel" aria-labelledby="pills-packages-tab">
								<div class="row">
									<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
										<div class="section-block">
											<h2 class="section-title">My Packages</h2>
										</div>
									</div>
									<div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
										<div class="card">
											<div class="card-header bg-primary text-center p-3 ">
												<h4 class="mb-0 text-white">Basic</h4>
											</div>
											<div class="card-body text-center">
												<h1 class="mb-1">$150</h1>
												<p>Per Month Plateform</p>
											</div>
											<div class="card-body border-top">
												<ul class="list-unstyled bullet-check font-14">
													<li>Facebook, Instagram, Pinterest,Snapchat.</li>
													<li>Guaranteed follower growth for increas brand awareness.</li>
													<li>Daily updates on choose platforms</li>
													<li>Stronger customer service through daily interaction</li>
													<li>Monthly progress report</li>
													<li>1 Million Followers</li>
												</ul>
												<a href="#" class="btn btn-outline-secondary btn-block btn-lg">Get Started</a>
											</div>
										</div>
									</div>
									<div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
										<div class="card">
											<div class="card-header bg-info text-center p-3">
												<h4 class="mb-0 text-white">Standard</h4>
											</div>
											<div class="card-body text-center">
												<h1 class="mb-1">$350</h1>
												<p>Per Month Plateform</p>
											</div>
											<div class="card-body border-top">
												<ul class="list-unstyled bullet-check font-14">
													<li>Facebook, Instagram, Pinterest,Snapchat.</li>
													<li>Guaranteed follower growth for increas brand awareness.</li>
													<li>Daily updates on choose platforms</li>
													<li>Stronger customer service through daily interaction</li>
													<li>Monthly progress report</li>
													<li>2 Blog Post & 3 Social Post</li>
													<li>5 Millions Followers</li>
													<li>Growth Result</li>
												</ul>
												<a href="#" class="btn btn-secondary btn-block btn-lg">Get Started</a>
											</div>
										</div>
									</div>
									<div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
										<div class="card">
											<div class="card-header bg-primary text-center p-3">
												<h4 class="mb-0 text-white">Premium</h4>
											</div>
											<div class="card-body text-center">
												<h1 class="mb-1">$550</h1>
												<p>Per Month Plateform</p>
											</div>
											<div class="card-body border-top">
												<ul class="list-unstyled bullet-check font-14">
													<li>Facebook, Instagram, Pinterest,Snapchat.</li>
													<li>Guaranteed follower growth for increas brand awareness.</li>
													<li>Daily updates on choose platforms</li>
													<li>Stronger customer service through daily interaction</li>
													<li>Monthly progress report & Growth Result</li>
													<li>4 Blog Post & 6 Social Post</li>
												</ul>
												<a href="#" class="btn btn-secondary btn-block btn-lg">Contact us</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- ======================================== 폼 세부 ============================================ -->
							<div class="tab-pane fade" id="pills-review" role="tabpanel" aria-labelledby="pills-packages-tab">
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
									<div class="card">
										<h5 class="card-header">빠른 입력</h5>
										<div class="card-body">
											<form id="validationform" data-parsley-validate="" novalidate="">
												<div class="form-group row">
													<label class="col-12 col-sm-3 col-form-label text-sm-right">Required</label>
													<div class="col-12 col-sm-8 col-lg-6">
														<input type="text" required="" placeholder="Type something" class="form-control">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-12 col-sm-3 col-form-label text-sm-right">Min Length</label>
													<div class="col-12 col-sm-8 col-lg-6">
														<input type="text" required="" data-parsley-minlength="6" placeholder="Min 6 chars." class="form-control">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-12 col-sm-3 col-form-label text-sm-right">Max Length</label>
													<div class="col-12 col-sm-8 col-lg-6">
														<input type="text" required="" data-parsley-maxlength="6" placeholder="Max 6 chars." class="form-control">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-12 col-sm-3 col-form-label text-sm-right">Range Length</label>
													<div class="col-12 col-sm-8 col-lg-6">
														<input type="text" required="" data-parsley-length="[5,10]" placeholder="Text between 5 - 10 chars length" class="form-control">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-12 col-sm-3 col-form-label text-sm-right">Min Value</label>
													<div class="col-12 col-sm-8 col-lg-6">
														<input type="text" required="" data-parsley-min="6" placeholder="Min value is 6" class="form-control">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-12 col-sm-3 col-form-label text-sm-right">Max Value</label>
													<div class="col-12 col-sm-8 col-lg-6">
														<input type="text" required="" data-parsley-max="6" placeholder="Max value is 6" class="form-control">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-12 col-sm-3 col-form-label text-sm-right">Range Value</label>
													<div class="col-12 col-sm-8 col-lg-6">
														<input required="" type="number" min="6" max="100" placeholder="Number between 6 - 100" class="form-control">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-12 col-sm-3 col-form-label text-sm-right">Regular Exp</label>
													<div class="col-12 col-sm-8 col-lg-6">
														<input type="text" required="" data-parsley-pattern="#[A-Fa-f0-9]{6}" placeholder="Hex. Color" class="form-control">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-12 col-sm-3 col-form-label text-sm-right">Equal To</label>
													<div class="col-sm-4 col-lg-3 mb-3 mb-sm-0">
														<input id="pass2" type="password" required="" placeholder="Password" class="form-control">
													</div>
													<div class="col-sm-4 col-lg-3">
														<input type="password" required="" data-parsley-equalto="#pass2" placeholder="Re-Type Password" class="form-control">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-3 col-form-label text-sm-right">Min check</label>
													<div class="col-sm-6">
														<div class="custom-controls-stacked">
															<label class="custom-control custom-checkbox"> <input id="ck1" name="ck1" type="checkbox" data-parsley-multiple="groups"
																value="bar" data-parsley-mincheck="2" data-parsley-errors-container="#error-container1" class="custom-control-input"
															><span class="custom-control-label">Option 1</span>
															</label> <label class="custom-control custom-checkbox"> <input id="ck2" name="ck2" type="checkbox" data-parsley-multiple="groups"
																value="bar2" data-parsley-mincheck="2" data-parsley-errors-container="#error-container1" class="custom-control-input"
															><span class="custom-control-label">Option 2</span>
															</label> <label class="custom-control custom-checkbox"> <input id="ck3" name="ck3" type="checkbox" data-parsley-multiple="groups"
																value="bar3" data-parsley-mincheck="2" required="" data-parsley-errors-container="#error-container1" class="custom-control-input"
															><span class="custom-control-label">Option 3</span>
															</label>
															<div id="error-container1"></div>
														</div>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-3 col-form-label text-sm-right">Max check</label>
													<div class="col-sm-6">
														<div class="custom-controls-stacked">
															<label class="custom-control custom-checkbox"> <input type="checkbox" value="bar" id="e1" data-parsley-multiple="group1"
																data-parsley-errors-container="#error-container2" class="custom-control-input"
															><span class="custom-control-label">Option 1</span>
															</label> <label class="custom-control custom-checkbox"> <input type="checkbox" value="bar" id="e2" data-parsley-multiple="group1"
																data-parsley-errors-container="#error-container2" class="custom-control-input"
															><span class="custom-control-label">Option 2</span>
															</label> <label class="custom-control custom-checkbox"> <input type="checkbox" value="bar" id="e3" data-parsley-multiple="group1"
																data-parsley-maxcheck="1" data-parsley-errors-container="#error-container2" class="custom-control-input"
															><span class="custom-control-label">Option 3</span>
															</label>
															<div id="error-container2"></div>
														</div>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-12 col-sm-3 col-form-label text-sm-right">E-Mail</label>
													<div class="col-12 col-sm-8 col-lg-6">
														<input type="email" required="" data-parsley-type="email" placeholder="Enter a valid e-mail" class="form-control">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-12 col-sm-3 col-form-label text-sm-right">URL</label>
													<div class="col-12 col-sm-8 col-lg-6">
														<input data-parsley-type="url" type="url" required="" placeholder="URL" class="form-control">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-12 col-sm-3 col-form-label text-sm-right">Digits</label>
													<div class="col-12 col-sm-8 col-lg-6">
														<input data-parsley-type="digits" type="text" required="" placeholder="Enter only digits" class="form-control">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-12 col-sm-3 col-form-label text-sm-right">Number</label>
													<div class="col-12 col-sm-8 col-lg-6">
														<input data-parsley-type="number" type="text" required="" placeholder="Enter only numbers" class="form-control">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-12 col-sm-3 col-form-label text-sm-right">Alphanumeric</label>
													<div class="col-12 col-sm-8 col-lg-6">
														<input data-parsley-type="alphanum" type="text" required="" placeholder="Enter alphanumeric value" class="form-control">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-12 col-sm-3 col-form-label text-sm-right">Textarea</label>
													<div class="col-12 col-sm-8 col-lg-6">
														<textarea required="" class="form-control"></textarea>
													</div>
												</div>
												<div class="form-group row text-right">
													<div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
														<button type="submit" class="btn btn-space btn-primary">Submit</button>
														<button class="btn btn-space btn-secondary">Cancel</button>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
							<!-- ======================================== 이메일 세부 ============================================ -->
							<div class="tab-pane fade" id="pills-msg" role="tabpanel" aria-labelledby="pills-msg-tab">
								<div class="card">
									<h5 class="card-header">빠른 EMAIL 전송</h5>
									<div class="email-compose-fields">
										<div class="to">
											<div class="form-group row pt-0">
												<label class="col-md-1 control-label">To:</label>
												<div class="col-md-11">
													<select class="js-example-basic-multiple" multiple="multiple">
														<option value="Yellow" selected="selected">Yellow</option>
														<option value="White">White</option>
														<option value="Blue" selected="selected">Blue</option>
													</select>
												</div>
											</div>
										</div>
										<div class="to cc">
											<div class="form-group row pt-2">
												<label class="col-md-1 control-label">Cc</label>
												<div class="col-md-11">
													<select class="js-example-basic-multiple" multiple="multiple">
														<option value="Alabama">Alabama</option>
														<option value="Alaska" selected="selected">Alaska</option>
														<option value="Melbourne">Melbourne</option>
														<option value="Victoria" selected="selected">Victoria</option>
														<option value="Newyork">Newyork</option>
													</select>
												</div>
											</div>
										</div>
										<div class="subject">
											<div class="form-group row pt-2">
												<label class="col-md-1 control-label">Subject</label>
												<div class="col-md-11">
													<input class="form-control" type="text">
												</div>
											</div>
										</div>
									</div>
									<div class="email editor">
										<div class="col-md-12 p-0">
											<div class="form-group">
												<label class="control-label sr-only" for="summernote">Descriptions </label>
												<textarea class="form-control" id="summernote" name="editordata" rows="6" placeholder="Write Descriptions"></textarea>
											</div>
										</div>
										<div class="email action-send">
											<div class="col-md-12 ">
												<div class="form-group">
													<button class="btn btn-primary btn-space" type="submit">
														<i class="icon s7-mail"></i> Send
													</button>
													<button class="btn btn-secondary btn-space" type="button">
														<i class="icon s7-close"></i> Cancel
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>