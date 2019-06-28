<%@page import="java.util.List"%>
<%@page import="jdbc.DBBeanMysql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String f_num = request.getParameter("f_num");
	String colum = request.getParameter("colum");
	DBBeanMysql db = DBBeanMysql.getInstance();
	List<String> result = db.getPlMas(colum, f_num);
	String temp = ""; 
	for (int i = 0; i < result.size(); i++) {
		if (i == result.size() - 1) {
			temp += result.get(i);
		} else {
			temp += result.get(i)+",";
			}
	}
%>
<%= temp %>

