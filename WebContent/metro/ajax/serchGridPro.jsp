<%@page import="java.util.List"%>
<%@page import="member.LoginUserDataBean"%>
<%@page import="jdbc.DBBeanMysql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String serchVar = request.getParameter("serchVar");
	String target = request.getParameter("target");
	String colum = request.getParameter("colum");
	DBBeanMysql db = DBBeanMysql.getInstance();
	List<LoginUserDataBean> ecList = db.serchEmpCusList(colum, serchVar, target);
%>
<%= ecList %>