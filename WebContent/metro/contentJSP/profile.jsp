<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="content">
	<!-- Main bar -->
	<div class="mainbar">
		<!-- Page heading -->
		<div class="page-head">
			<!-- Page heading -->
			<h2 class="pull-left">
				Profile
				<!-- page meta -->
				<span class="page-meta">개인정보 조회</span>
			</h2>
			<!-- Breadcrumb -->
			<div class="bread-crumb pull-right">
				<a href="index.html"><i class="fa fa-home"></i> Home</a>
				<!-- Divider -->
				<span class="divider">/</span> <a href="#" class="bread-current">Profile</a>
			</div>
			<div class="clearfix"></div>
		</div>
		<!--/ Page heading ends -->
		<!-- Matter -->
		<div class="matter">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="widget wred">
							<div class="widget-head">
								<div class="pull-left">Profile</div>
								<div class="widget-icons pull-right">
									<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
									<a href="#" class="wclose"><i class="fa fa-times"></i></a>
								</div>
								<div class="clearfix"></div>
							</div>

							<div class="widget-content">
								<div class="padd">
									<!-- Profile form -->
									<div class="form profile">
										<!-- Edit profile form (not working)-->
										<form class="form-horizontal">
											<!-- Name -->
											<div class="form-group">
												<label class="control-label col-lg-2" for="name1">Name</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" id="name1">
												</div>
											</div>
											<!-- Email -->
											<div class="form-group">
												<label class="control-label col-lg-2" for="email1">Email</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" id="email1">
												</div>
											</div>
											<!-- Telephone -->
											<div class="form-group">
												<label class="control-label col-lg-2" for="telephone">Telephone</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" id="telephone">
												</div>
											</div>
											<!-- Address -->
											<div class="form-group">
												<label class="control-label col-lg-2" for="address">Address</label>
												<div class="col-lg-6">
													<textarea class="form-control" id="address"></textarea>
												</div>
											</div>
											<!-- Country -->
											<div class="form-group">
												<label class="control-label col-lg-2">Country</label>
												<div class="col-lg-6">
													<select class="form-control">
														<option value="">--- Please Select ---</option>
														<option value="1">Afghanistan</option>
														<option value="2">Albania</option>
														<option value="3">Algeria</option>
													</select>
												</div>
											</div>
											<!-- State -->
											<div class="form-group">
												<label class="control-label col-lg-2" for="city">State</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" id="state">
												</div>
											</div>
											<!-- City -->
											<div class="form-group">
												<label class="control-label col-lg-2" for="city">City</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" id="city">
												</div>
											</div>
											<!-- Username -->
											<div class="form-group">
												<label class="control-label col-lg-2" for="username2">Username</label>
												<div class="col-lg-6">
													<input type="text" class="form-control" id="username2">
												</div>
											</div>
											<!-- Password -->
											<div class="form-group">
												<label class="control-label col-lg-2" for="password2">Password</label>
												<div class="col-lg-6">
													<input type="password" class="form-control" id="password2">
												</div>
											</div>
											<!-- Checkbox -->
											<div class="form-group">
												<div class="col-lg-6 col-lg-offset-2">

													<label class="checkbox inline"> <input
														type="checkbox" id="inlineCheckbox3" value="agree">
														Agree with Terms and Conditions
													</label>
												</div>
											</div>

											<!-- Buttons -->
											<div class="form-group">
												<!-- Buttons -->
												<div class="col-lg-6 col-lg-offset-2">
													<button type="submit" class="btn btn-success">Update</button>
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
			</div>
		</div>
		<!--/ Matter ends -->
	</div>
	<!--/ Mainbar ends -->
	<div class="clearfix"></div>
</div>