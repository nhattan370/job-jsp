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
            	<c:if test="${saveJobList.size() > 0}">
                <div class="row">
                    <c:forEach var="saveJob" items="${saveJobList}">
	    				<comp:saveJobCard 
	    						DETAIL_RECRUITMENT="${DETAIL_RECRUITMENT}"
	    						DETAIL_COMPANY="${DETAIL_COMPANY}"
	    						sa="${saveJob}"
	    				/>
                    </c:forEach>
                </div>
             </c:if>
                
             <c:if test="${saveJobList.size() < 1}">
	              <div style="text-align: center">
	                  <p style="color:red;">Danh sách trống</p>
	              </div>
             </c:if>
                
<%--                 <div class="row mt-5">
                    <div class="col text-center">
                        <div class="block-27">
                            <ul>
                                <li th:if="${numberPage>0}"><a th:href="@{/save-job/get-list(page = ${saveJobList.number - 1})}">&lt;</a></li>
                                <th:block th:each="recruitment,state  : ${recruitmentList}">
                                    <li th:class="${numberPage == state.index  ? 'active' : null }"><a th:href="@{/save-job/get-list(page = ${state.index})}" th:text="${state.index + 1}"></a></li>
                                </th:block>
                                <li th:if="${numberPage<saveJobList.totalPages - 1}"><a th:href="@{/save-job/get-list(page = ${saveJobList.number + 1})}">&gt;</a></li>
                            </ul>
                        </div>
                    </div>
                </div> 
--%>
                
            </div>
        </div>
    </div>
</section>

<!-- start footer -->
	<%@ include file="/WEB-INF/common/footer.jsp" %>
<!-- end footer -->
</body>
</html>