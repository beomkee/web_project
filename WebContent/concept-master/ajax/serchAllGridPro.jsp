<%@page import="member.LoginUserDataBean"%>
<%@page import="java.util.List"%>
<%@page import="jdbc.DBBeanMysql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String target = request.getParameter("target");
	DBBeanMysql db = DBBeanMysql.getInstance();
	List<LoginUserDataBean> ecList = db.getEmpCusList(target);
%>
<%= ecList %>