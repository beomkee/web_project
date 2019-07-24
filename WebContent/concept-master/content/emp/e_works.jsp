<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>업무 현황</title>
<div class="dashboard-wrapper">
	<div class="container-fluid dashboard-content">
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="page-header">
					<h2 class="pageheader-title">나의 업무 현황</h2>
				</div>
			</div>
		</div>
		<div class="row">
			<div style="width: 847px; margin-left: auto; margin-right: auto" id="main">
				<div class="card">
					<h5 class="card-header">업무 등록</h5>
					<div class="card-body">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<td class="bg-light text-dark">생산번호</td>
									<td colspan="5">
										<input type="text" name="mf_num" id="mf_num" class="form-control-small" value=" --- " readonly="readonly">
									</td>
								</tr>
								<tr>
									<td class="bg-light text-dark">공장번호</td>
									<td>
										<select class="form-control form-control-sm" name="f_num" id="f_num">
											<option></option>
											<c:forEach var="fac" items="${facs}">
												<option value="${fac}">${fac}</option>
											</c:forEach>
										</select>
									</td>
									<td class="bg-light text-dark">생산라인</td>
									<td>
										<select class="form-control form-control-sm" name="pl_num" id="pl_num">
											<option></option>
											<option value="p_1">p_1</option>
											<option value="p_2">p_2</option>
											<option value="p_3">p_3</option>
										</select>
									</td>
									<td class="bg-light text-dark">담당직원</td>
									<td>
										<select class="form-control form-control-sm" name="e_id" id="e_id">
											<option></option>
											<c:forEach var="emp" items="${emps}">
												<option value="${emp}">${emp}</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td class="bg-light text-dark">상품번호</td>
									<td>
										<select class="form-control form-control-sm" name="p_num" id="p_num">
											<option></option>
											<c:forEach var="product" items="${products}">
												<option value="${product}">${product}</option>
											</c:forEach>
										</select>
									</td>
									<td class="bg-light text-dark">생산수량</td>
									<td>
										<input type="number" min="1000" step="500" name="mf_count" id="mf_count" class="form-control-small">
									</td>
									<td class="bg-light text-dark">생산일자</td>
									<td>
										<input type="date" name="mf_date" id="mf_date" class="form-control-small">
									</td>
								</tr>
							</tbody>
						</table>
						<div style="text-align: right; margin-top: 10px">
							<input type="button" onclick="search()" class="btn btn-outline-primary btn-xs" value="검색">
							<input type="button" onclick="insertUpdate()" class="btn btn-outline-success btn-xs" value="등록/수정">
							<input type="button" onclick="reset()" class="btn btn-outline-light btn-xs" value="초기화">
						</div>
					</div>
				</div>
				<div class="card">
					<h5 class="card-header">${pl}정보</h5>
					<div class="card-body">
						<c:if test="${pl eq 'mf'}">
							<table class="table table-bordered">
								<thead class="bg-light">
									<tr class="border-0" style="text-align: center">
										<th class="border-0">#</th>
										<th class="border-0">공장번호</th>
										<th class="border-0">라인번호</th>
										<th class="border-0">상품번호</th>
										<th class="border-0">생산량</th>
										<th class="border-0">생산일자</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="mf" items="${works}">
										<tr>
											<th style="text-align: center">${mf.mf_num}</th>
											<td style="text-align: center">${mf.f_num}</td>
											<td style="text-align: center">${mf.pl_num}</td>
											<td style="text-align: center">${mf.p_num}</td>
											<td style="text-align: center">${mf.mf_count}</td>
											<td style="text-align: center">${mf.mf_date}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:if>
						<c:if test="${pl eq 'sale'}">
							<table class="table">
								<thead class="bg-light">
									<tr class="border-0" style="text-align: center">
										<th class="border-0">#</th>
										<th class="border-0">생산번호</th>
										<th class="border-0">상품번호</th>
										<th class="border-0">판매량</th>
										<th class="border-0">판매일자</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="sale" items="${works}">
										<tr>
											<th style="text-align: center">${sale.s_num}</th>
											<td style="text-align: center">${sale.mf_num}</td>
											<td style="text-align: center">${sale.p_num}</td>
											<td style="text-align: center">${sale.s_contract_sum}</td>
											<td style="text-align: center">${sale.s_obtain_date}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>