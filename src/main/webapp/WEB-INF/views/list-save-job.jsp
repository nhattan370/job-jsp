<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="comp" tagdir="/WEB-INF/tags" %>   
<!DOCTYPE html>
<html lang="en">
<head><%@ include file="/WEB-INF/common/head.jsp" %></head>
<body>
<!-- start nav -->
	<%@ include file="/WEB-INF/common/navbar.jsp" %>
	
	<comp:pageHero title="Danh sách công việc đã lưu" breadcrumb="Công việc"/>

<section class="ftco-section bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 pr-lg-5">
            	<c:if test="${saveJobList.totalItems > 0}">
                <div class="row">
                    <c:forEach var="saveJob" items="${saveJobList.data}">
	    				<comp:saveJobCard 
	    						DETAIL_RECRUITMENT="${DETAIL_RECRUITMENT}"
	    						DETAIL_COMPANY="${DETAIL_COMPANY}"
	    						sa="${saveJob}"
	    				/>
                    </c:forEach>
                </div>
             </c:if>
                
             <c:if test="${saveJobList.totalItems < 1}">
	              <div style="text-align: center">
	                  <p style="color:red;">Danh sách trống</p>
	              </div>
             </c:if>
             
             <!-- pagination -->
             <comp:pagination ob="${saveJobList}" link="${LIST_SAVE_JOB}?"/>
  
            </div>
        </div>
    </div>
</section>

<!-- start footer -->
	<%@ include file="/WEB-INF/common/footer.jsp" %>
<!-- end footer -->
</body>
</html>