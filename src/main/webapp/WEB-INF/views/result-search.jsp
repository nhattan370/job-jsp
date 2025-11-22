<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head><%@ include file="/WEB-INF/common/head.jsp" %></head>
<body>
<%@ include file="/WEB-INF/common/navbar.jsp" %>
	
<!-- general interface -->
	<%@include file="/WEB-INF/common/general.jsp" %>
	
<!-- show result search with typeSearch=job -->
	<c:if test="${param.typeSearch==sessionScope.listType[0] || param.typeSearch==sessionScope.listType[2]}">
		<%@include file="/WEB-INF/common/result-search-job.jsp" %>
	</c:if>
<!-- show result search with typeSearch=user -->
	<c:if test="${param.typeSearch==sessionScope.listType[1]}">
		<%@include file="/WEB-INF/common/result-search-user.jsp"%>
	</c:if>
<!-- start footer -->
	<%@ include file="/WEB-INF/common/footer.jsp" %>
<!-- end footer -->
</body>
</html>