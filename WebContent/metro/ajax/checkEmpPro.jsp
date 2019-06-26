<%@page import="member.LoginUserDataBean"%>
<%@page import="jdbc.DBBeanMysql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String checkId = request.getParameter("checkId");	
	DBBeanMysql manager = DBBeanMysql.getInstance();
	LoginUserDataBean info = manager.getUserInfo(checkId);
%>
<%= info.toString() %>
