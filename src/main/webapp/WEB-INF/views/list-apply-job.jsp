<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="comp" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="en">
<head><%@ include file="/WEB-INF/common/head.jsp" %></head>
<body>
<!-- start nav -->
	<%@ include file="/WEB-INF/common/navbar.jsp" %>
<!-- end nav -->
	
	<comp:pageHero title="Danh sách công việc đã ứng tuyển" breadcrumb="Công việc"/>

<section class="ftco-section bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 pr-lg-5">
            	<c:if test="${applyJobList.totalItems>0}">
                <div class="row">
                    <c:forEach var="applyJob" items="${applyJobList.data}">
                        <comp:applyJobCard ap="${applyJob}" 
                        				   DETAIL_COMPANY="${DETAIL_COMPANY}" 
                        				   DETAIL_RECRUITMENT="${DETAIL_RECRUITMENT}"/>
					    
                    </c:forEach>
                </div>
                </c:if>
                <c:if test="${applyJobList.totalItems < 1}">
	                <div style="text-align: center">
	                    <p style="color:red;">Danh sách trống</p>
	                </div>
                </c:if>
                <comp:pagination ob="${applyJobList}" link="${LIST_APPLY}?"/>
            </div>

        </div>
    </div>
</section>
<!-- start footer -->
	<%@ include file="/WEB-INF/common/footer.jsp" %>
<!-- end footer -->
</body>
</html>