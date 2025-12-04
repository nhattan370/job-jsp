<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ tag language="java" body-content="scriptless" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

<%-- <%@ attribute name="status" type="enums.ApplyPostStatus" required="true" %>
<%@ attribute name="id" required="true" %>
<%@ attribute name="nameCv" required="true" %> --%>
<%@ attribute name="ap" type="model.ApplyPost" required="true" %>
<%@ attribute name="HANDLE_CV" required="true" %>
<sec:authorize access="hasAuthority('USER')">
	<c:if test="${ap.status.name() == 'PENDING'}">
	   	<p style="color: red; font-weight: bold; margin-top: 10px;">Chờ duyệt</p>
	</c:if>
	
	<c:if test="${ap.status.name() == 'SUITABLE'}">
	   	<p style="color: #1e7e34; font-weight: bold; margin-top: 10px;">Phù hợp</p>
	</c:if>
	
	<c:if test="${ap.status.name() == 'VIEWED'}">
	   	<p style="color: #007bff; font-weight: bold; margin-top: 10px;">Đã xem</p>
	</c:if>
	
	<c:if test="${ap.status.name() == 'UNSUITABLE'}">
	   	<p style="color: gray; font-weight: bold; margin-top: 10px;">Không phù hợp</p>
	</c:if>
	<c:if test="${ap.status.name() == 'WITHDRAWN'}">
	   	<p style="color: red; font-weight: bold; margin-top: 10px;">Đã rút đơn</p>
	</c:if>
</sec:authorize>	
	
<sec:authorize access="hasAuthority('RECRUITER')">
    <c:if test="${ap.status.name() == 'PENDING'}">
     	<p style="margin-left: 10px"><a class="btn btn-outline-primary" href="${HANDLE_CV}?id=${ap.id}&status='VIEWED'" >Xem</a></p>
    </c:if>
    <c:if test="${ap.status.name() == 'VIEWED'}">
    	<p style="margin-left: 10px"><a class="btn btn-outline-success" href="${ap.nameCv}" target="_blank">Đã xem</a></p>
    	<p style="margin-left: 10px"><a class="btn btn-outline-warning ${ap.status.name()=='SUITABLE'||ap.status.name()=='UNSUITABLE' ? 'disabled' : ''}" href="${HANDLE_CV}?id=${ap.id}&&?status='SUITABLE'">Phù hợp</a></p>
    	<p style="margin-left: 10px"><a class="btn btn-outline-danger ${ap.status.name()=='SUITABLE'||ap.status.name()=='UNSUITABLE' ? 'disabled' : ''}" href="${HANDLE_CV}?id=${ap.id}&&?status='UNSUITABLE'">Không phù hợp</a></p>
	</c:if>
	<c:if test="${ap.status.name() == 'WITHDRAWN'}">
		<p style="margin-left: 10px;margin-top: 15px"><span style="color: #fd7e14;font-weight: bold" >Ứng viên rút đơn</span></p>
	</c:if>
</sec:authorize>