<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${check == 1 }">
	<c:if test="${userDiv == 1 }">
		<meta http-equiv="Refresh" content="0;url=<%=request.getContextPath()%>/main/mainUser.do">
	</c:if>
	<c:if test="${userDiv == 2 }">
		<meta http-equiv="Refresh" content="0;url=<%=request.getContextPath()%>/main/mainManager.do">
	</c:if>
	<c:if test="${userDiv == 3 }">
		<meta http-equiv="Refresh" content="0;url=<%=request.getContextPath()%>/main/mainPartner.do">
	</c:if>
</c:if>
<c:if test="${check == 2 }">
	<script>
		alert("아이디가 틀립니다");
		history.back();
	</script>
</c:if>
<c:if test="${check != 1 && check != 2 }">
	<script>
		alert("비밀번호가 틀립니다");
		history.back();
	</script>
</c:if>