<%@page import="member.LoginUserDataBean"%>
<%@page import="jdbc.DBBeanMysql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>개인 정보 상세</title>
<%  
	String checkId = (String)session.getAttribute("LOGINED_ID");
	DBBeanMysql manager = DBBeanMysql.getInstance();
	LoginUserDataBean user = manager.getUserInfo(checkId);
%>
<c:set var="user" value="<%=user%>" />
		<div class="dashboard-wrapper">
            <div class="container-fluid dashboard-content">
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    </div>
                </div>
                <div class="row">
                    <div style="width: 847px; margin-left: auto; margin-right: auto">
                            <div class="card">
                                <h5 class="card-header">${user.name}'s Profile</h5>
                                <div class="card-body">
                                    <table class="table table-hover">
                                        <tbody>
                                            <tr>
                                                <td >ID</td>
                                                <td>${user.id}</td>
                                            </tr>
                                            <tr>
                                                <td >PW</td>
                                                <td>
                                                <input type="password" class="form-control is-valid" id="validationServer01" name="password" placeholder="password" required>
												</td>
                                            </tr>
                                            <tr>
                                                <td scope="row">PW-CHECK</td>
                                                <td>
                                                <input type="password" required="" class="form-control is-invalid" id="validationCustom02">
                                               </td>
                                            </tr>
                                            <tr>
                                                <td scope="row">NAME</td>
                                                <td colspan="2">${user.name}</td>
                                            </tr>
                                            <tr>
                                                <td scope="row">EMAIL</td>
                                                <td colspan="2">${user.email}</td>
                                            </tr>
                                            <tr>
                                                <td scope="row">TEL</td>
                                                <td colspan="2">${user.tel}</td>
                                            </tr>
                                            <tr>
                                                <td scope="row">BIRTH</td>
                                                <td colspan="2">${user.birth}</td>
                                            </tr>
                                            <tr>
                                                <td scope="row">MANAGER_NUM</td>
                                                <td colspan="2">${user.manager_num}</td>
                                            </tr>
                                            <tr>
                                                <td scope="row">F_NUM</td>
                                                <td colspan="2">${user.f_num}</td>
                                            </tr>
                                            <tr>
                                                <td scope="row">PL_NUM</td>
                                                <td colspan="2">${user.pl_num}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
	                </div>
	            </div>
