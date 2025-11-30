<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ tag language="java" body-content="scriptless" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

<%@ attribute name="status" type="enums.ApplyPostStatus" required="true" %>
<%@ attribute name="HANDLE_CV" required="false" %>
<%@ attribute name="id" required="false" %>
<sec:authorize access="hasAuthority('USER')">
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
</sec:authorize>	
	
<sec:authorize access="hasAuthority('RECRUITER')">
    <c:if test="${status.name() == 'PENDING'}">
     	<p style="margin-left: 10px"><a class="btn btn-outline-primary" href="${HANDLE_CV}${id}" >Duyệt</a></p>
    </c:if>
    <c:if test="${status.name() == 'VIEWED'}">
    	<p style="margin-left: 10px"><a class="btn btn-outline-success" href="${HANDLE_CV}${id}" >Đã xem</a></p>
	</c:if>
	<c:if test="${status.name() == 'SUITABLE'}">
		<p style="margin-left: 10px;margin-top: 15px"><span style="color: #1e7e34;font-weight: bold" >Đã duyệt</span></p>
	</c:if>
	<c:if test="${status.name() == 'UNSUITABLE'}">
		<p style="margin-left: 10px;margin-top: 15px"><span style="color: #dc3545;font-weight: bold" >Đã xem</span></p>
	</c:if>
	<c:if test="${status.name() == 'WITHDRAWN'}">
		<p style="margin-left: 10px;margin-top: 15px"><span style="color: #fd7e14;font-weight: bold" >Ứng viên rút đơn</span></p>
	</c:if>
</sec:authorize>