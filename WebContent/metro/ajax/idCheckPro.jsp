<%@page import="jdbc.DBBeanMysql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%
	String id = request.getParameter("id");
	DBBeanMysql db = DBBeanMysql.getInstance();
	boolean check = db.idValidationCheck(id);
%>
<%= check %>