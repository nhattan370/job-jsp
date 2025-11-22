<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="comp" tagdir="/WEB-INF/tags" %>   
<section class="ftco-section bg-light">

	<!-- show toast -->
	<div id="alert-container" style="position: fixed; top: 60px; left: 20px; z-index: 9999;"></div>
	
    <div class="container">
        <h4 style="margin-top: -20px">Kết quả tìm kiếm cho : ${param.keySearch}</h4>
        <div class="row">
            <div class="col-lg-12 pr-lg-5">
                <div class="row">
                    <c:forEach var="recruitment"  items="${list}" >
 						<div class="col-md-12 ">
                            <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
                                <div class="one-third mb-4 mb-md-0">
                                    <div class="job-post-item-header align-items-center">
                                        <span class="subadge">${recruitment.type}</span>
                                        <h2 class="mr-3 text-black"><a href="${DETAIL_RECRUITMENT}${recruitment.id}">${recruitment.title}</a></h2>
                                    </div>
                                    <div class="job-post-item-body d-block d-md-flex">
                                        <div class="mr-3"><span class="icon-layers"></span> <a href="${DETAIL_COMPANY}${recruitment.idCompany}">${recruitment.nameCompany}</a></div>
                                        <div><span class="icon-my_location"></span> <span>${recruitment.address}</span></div>
                                    </div>
                                </div>
                                <input type="hidden" id="idRe${recruitment.id}" value="${recruitment.id}">
	                                
 	                                <sec:authorize access="hasAuthority('USER') || !isAuthenticated()">
									    <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
									        <div>
									        	<comp:saveButton id="${recruitment.id}"></comp:saveButton>
									        </div>
									        <comp:applyButton id="${recruitment.id}"/>
									    </div>
									</sec:authorize>
                            </div>
                        </div>
                        <!-- end -->
                        <!-- Modal -->
                        
                           <%-- <jsp:include page="/WEB-INF/common/apply-modal.jsp">
		                   		<jsp:param value="${recruitment.id}" name="id"/>
		                   		<jsp:param value="${recruitment.title}" name="title"/>
		                   </jsp:include> --%>
		                   <comp:applyModal id="${recruitment.id}" title="${recruitment.title}"/>
                        
                    </c:forEach>
                    <c:if test="${list.size()==0}">
	                    <div style="text-align: center">
	                        <p style="color: red">Không có kết quả nào</p>
	                    </div>
                    </c:if>
                </div>

<%--                 <div class="row mt-5">
                    <div class="col text-center">
                        <div class="block-27">
                            <ul>
                                <li th:if="${numberPage>0}"><a th:href="@{'/recruitment/search/'+ ${keySearch}(page = ${list.number - 1})}">&lt;</a></li>
                                <th:block th:each="recruitment,state  : ${recruitmentList}">
                                    <li th:class="${numberPage == state.index  ? 'active' : null }"><a th:href="@{'/recruitment/search/'+ ${keySearch}(page = ${state.index})}" th:text="${state.index + 1}"></a></li>
                                </th:block>
                                <li th:if="${numberPage<list.totalPages - 1}"><a th:href="@{'/recruitment/search/'+ ${keySearch}(page = ${list.number + 1})}">&gt;</a></li>
                            </ul>
                        </div>
                    </div>
                </div> --%>
            </div>

        </div>
    </div>
</section>