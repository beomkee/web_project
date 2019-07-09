<%@page import="service.LeftMenuService"%>
<%@page import="left.LeftMenuDataBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("utf-8");
	LeftMenuService leftService = LeftMenuService.getInstance();
	List<LeftMenuDataBean> left = leftService.selectAllLeft();
%>
<%=left%>