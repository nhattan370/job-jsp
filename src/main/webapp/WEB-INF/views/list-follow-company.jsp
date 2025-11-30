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
	<comp:pageHero title="Danh sách công ty đã theo dõi" breadcrumb="Công ty"/>

<section class="ftco-section bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 pr-lg-5">
            	<c:if test="${followCompanies.size() > 0}">
                <div class="row">
                	<c:forEach var="follow" items="${followCompanies}">
                		<comp:wrapperCard id="${follow.id}">
                                <div class="one-third mb-4 mb-md-0">
                                    <div class="job-post-item-header align-items-center">
                                        <h2 class="mr-3 text-black"><a href="${DETAIL_COMPANY}${follow.company.id}">${follow.company.nameCompany}</a></h2>
                                    </div>
                                    <div class="job-post-item-body d-block d-md-flex">
                                        <div class="mr-3"><span class="icon-layers"></span> <a>${follow.company.email}</a></div>
                                        <div class="mr-3"><span class="icon-my_location"></span> <span>${follow.company.address}</span></div>
                                        <div style="margin-left: 10"><span class="icon-my_location"></span> <span>${follow.company.phoneNumber}</span></div>
                                    </div>
                                </div>
                                <input type="hidden" id="idFc${follow.id}" value="${follow.id}">
                                <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0" style="width:370px !important;">
                                    <div>
                                        <comp:deleteButton id="${follow.id}"></comp:deleteButton>
                                    </div>
                                    <a href="${DETAIL_COMPANY}${follow.company.id}" class="btn btn-primary py-2">Chi tiết</a>
                                    <a href="${LIST_POST}${follow.company.id}" class="btn btn-warning py-2 ml-1">Danh sách bài đăng</a>
                                </div>
                        </comp:wrapperCard>
                        <!-- Modal xác nhận xóa -->
					    <comp:modalDelete
    						id="${follow.id}"
   							idHidden="idFc"
    						nameCompany="${follow.company.nameCompany}"
    						onConfirm="deleteFollowCompany(${follow.id})"
						/>
					</c:forEach>
                </div>
               </c:if>
               
               <c:if test="${followCompanies.size() < 1}">
	                <div style="text-align: center">
	                    <p style="color:red;">Danh sách trống</p>
	                </div>
                </c:if>
<%--                 <div class="row mt-5">
                    <div class="col text-center">
                        <div class="block-27">
                            <ul>
                                <li th:if="${numberPage>0}"><a th:href="@{/save-job/get-list(page = ${followCompanies.number - 1})}">&lt;</a></li>
                                <th:block th:each="recruitment,state  : ${recruitmentList}">
                                    <li th:class="${numberPage == state.index  ? 'active' : null }"><a th:href="@{/save-job/get-list(page = ${state.index})}" th:text="${state.index + 1}"></a></li>
                                </th:block>
                                <li th:if="${numberPage<followCompanies.totalPages - 1}"><a th:href="@{/save-job/get-list(page = ${followCompanies.number + 1})}">&gt;</a></li>
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