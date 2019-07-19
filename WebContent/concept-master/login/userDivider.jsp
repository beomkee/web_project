<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${check == 1 }">
	<c:if test="${userDiv == 1 }">
		<meta http-equiv="Refresh" content="0;url=<%=request.getContextPath()%>/profile/main.do?div=e">
	</c:if>
	<c:if test="${userDiv == 2 }">
		<meta http-equiv="Refresh" content="0;url=<%=request.getContextPath()%>/profile/main.do?div=m">
	</c:if>
	<c:if test="${userDiv == 3 }">
		<meta http-equiv="Refresh" content="0;url=<%=request.getContextPath()%>/profile/main.do?div=p">
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