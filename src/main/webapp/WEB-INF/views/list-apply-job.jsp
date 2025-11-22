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
            	<c:if test="${applyJobList.size()>0}">
                <div class="row">
                    <c:forEach var="applyJob" items="${applyJobList}">
                        <div class="col-md-12 ">
                            <div class="job-post-item p-4 d-block d-lg-flex align-items-center" id="job-item-${applyJob.id}">
                                <div class="one-third mb-4 mb-md-0">
                                    <div class="job-post-item-header align-items-center">
                                        <span class="subadge">${applyJob.recruitment.type}</span>
                                        <h2 class="mr-3 text-black" ><a href="${DETAIL_RECRUITMENT}${applyJob.recruitment.id}">${applyJob.recruitment.title}</a></h2>
                                    </div>
                                    <div class="job-post-item-body d-block d-md-flex">
                                        <div class="mr-3"><span class="icon-layers"></span> <a href="${DETAIL_COMPANY}${applyJob.recruitment.company.id}">${applyJob.recruitment.company.nameCompany}</a></div>
                                        <div><span class="icon-my_location"></span> <span>${applyJob.recruitment.address}</span></div>
                                    </div>
                                </div>
                                <input type="hidden" id="idApply${applyJob.id}" value="${applyJob.id}">
                                <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
                                    <div>
                                        <button type="button"
										        class="btn btn-outline-danger btn-sm mr-2"
										        data-toggle="modal"
										        data-target="#deleteModal${applyJob.id}">
										    Rút đơn
										</button>
                                        
                                    </div>
	                                    <c:if test="${applyJob.status.name() == 'PENDING'}">
										    <p style="color: red; font-weight: bold; margin-top: 10px;">Chờ duyệt</p>
										</c:if>
										
										<c:if test="${applyJob.status.name() == 'SUITABLE'}">
										    <p style="color: #1e7e34; font-weight: bold; margin-top: 10px;">Phù hợp</p>
										</c:if>
										
										<c:if test="${applyJob.status.name() == 'VIEWED'}">
										    <p style="color: #007bff; font-weight: bold; margin-top: 10px;">Đã xem</p>
										</c:if>
										
										<c:if test="${applyJob.status.name() == 'UNSUITABLE'}">
										    <p style="color: gray; font-weight: bold; margin-top: 10px;">Không phù hợp</p>
										</c:if>
										<c:if test="${applyJob.status.name() == 'WITHDRAWN'}">
										    <p style="color: red; font-weight: bold; margin-top: 10px;">Đã rút đơn</p>
										</c:if>
                                </div>
                            </div>
                        </div><!-- end -->
                        
   						<!-- Modal xác nhận xóa -->
					    <comp:modalDelete
						    id="${applyJob.id}"
						    idHidden="idApply"
						    title="${applyJob.recruitment.title}"
						    onConfirm="deleteApply(${applyJob.id})"
						/>
					    
                    </c:forEach>
                </div>
                </c:if>
                <c:if test="${applyJobList.size() < 1}">
	                <div style="text-align: center">
	                    <p style="color:red;">Danh sách trống</p>
	                </div>
                </c:if>
<%--                 <div class="row mt-5">
                    <div class="col text-center">
                        <div class="block-27">
                            <ul>
                                <li th:if="${numberPage>0}"><a th:href="@{/save-job/get-list(page = ${applyJobList.number - 1})}">&lt;</a></li>
                                <th:block th:each="recruitment,state  : ${recruitmentList}">
                                    <li th:class="${numberPage == state.index  ? 'active' : null }"><a th:href="@{/save-job/get-list(page = ${state.index})}" th:text="${state.index + 1}"></a></li>
                                </th:block>
                                <li th:if="${numberPage<applyJobList.totalPages - 1}"><a th:href="@{/save-job/get-list(page = ${applyJobList.number + 1})}">&gt;</a></li>
                            </ul>
                        </div>
                    </div>
                </div> --%>
            </div>

        </div>
    </div>
</section>
<!-- start footer -->
	<%@ include file="/WEB-INF/common/footer.jsp" %>
<!-- end footer -->
</body>
</html>