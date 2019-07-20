<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>공지 사항</title>
<div class="dashboard-wrapper">
	<div class="container-fluid dashboard-content">
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="card">
					<h5 class="card-header">공지사항</h5>
					<div class="card-body">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col" width="60%" style="text-align: center">내용</th>
									<th scope="col" style="text-align: center">등록일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="notice" items="${notices}">
									<tr>
										<th scope="row">${notice.n_num }</th>
										<td>${notice.title }</td>
										<td style="text-align: center">${notice.mod_date}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>