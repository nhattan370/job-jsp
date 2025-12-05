<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ tag language="java" body-content="scriptless" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

<%-- <%@ attribute name="status" type="enums.ApplyPostStatus" required="true" %>
<%@ attribute name="id" required="true" %>
<%@ attribute name="nameCv" required="true" %> --%>
<%@ attribute name="ap" type="model.ApplyPost" required="true" %>
<%@ attribute name="HANDLE_CV" required="true" %>
<%@ attribute name="SHOW_CV" required="true" %>
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
     	<p style="margin-left: 10px"><a class="btn btn-outline-primary" onclick="viewCv(${ap.id})" id="viewCv${ap.id}">Xem</a></p>
    </c:if>
    <c:if test="${ap.status.name() != 'PENDING'}">
    	<p style="margin-left: 10px"><a class="btn btn-outline-success" href="${ap.nameCv}" target="_blank" id="viewedText${ap.id}">Đã xem</a></p>
    </c:if>
    <c:if test="${ap.status.name() == 'VIEWED'}">
    	<p style="margin-left: 10px"><a class="btn btn-outline-warning" onclick="updateStatus(${ap.id},'SUITABLE')" id="suitableBtn${ap.id}">Phù hợp</a></p>
    	<p style="margin-left: 10px"><a class="btn btn-outline-danger" onclick="updateStatus(${ap.id},'UNSUITABLE')" id="unsuitableBtn${ap.id}" >Không phù hợp</a></p>
	</c:if>
	<c:if test="${ap.status.name()=='SUITABLE' }">
		<p style="margin-left: 10px; margin-top:5px;"><span style="color: #28a745;font-weight: bold" id="suitableText${ap.id}">Phù hợp</span></p>
	</c:if>
	<c:if test="${ap.status.name()=='UNSUITABLE'}">
		<p style="margin-left: 10px;margin-top:5px;"><span style="color: #dc3545;font-weight: bold" id="unsuitableText${ap.id}">Không phù hợp</span></p>
	</c:if>
	<c:if test="${ap.status.name() == 'WITHDRAWN'}">
		<p style="margin-left: 10px;margin-top:5px;"><span style="color: #6c757d;font-weight: bold">Ứng viên rút đơn</span></p>
	</c:if>
</sec:authorize>