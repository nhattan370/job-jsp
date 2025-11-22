<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ tag language="java" body-content="scriptless" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="status" type="enums.ApplyPostStatus" required="true" %>
        <c:if test="${status.name() == 'PENDING'}">
	    	<p style="color: red; font-weight: bold; margin-top: 10px;">Chờ duyệt</p>
		</c:if>
	
		<c:if test="${status.name() == 'SUITABLE'}">
	    	<p style="color: #1e7e34; font-weight: bold; margin-top: 10px;">Phù hợp</p>
		</c:if>
	
		<c:if test="${status.name() == 'VIEWED'}">
	    	<p style="color: #007bff; font-weight: bold; margin-top: 10px;">Đã xem</p>
		</c:if>
	
		<c:if test="${status.name() == 'UNSUITABLE'}">
	    	<p style="color: gray; font-weight: bold; margin-top: 10px;">Không phù hợp</p>
		</c:if>
		<c:if test="${status.name() == 'WITHDRAWN'}">
	    	<p style="color: red; font-weight: bold; margin-top: 10px;">Đã rút đơn</p>
		</c:if>