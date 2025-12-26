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
            	<c:if test="${followCompanies.totalItems > 0}">
                <div class="row">
                	<c:forEach var="follow" items="${followCompanies.data}">
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
                                    <a href="${COMPANY_POST}${follow.company.id}" class="btn btn-warning py-2 ml-1">Danh sách bài đăng</a>
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
               
               <c:if test="${followCompanies.totalItems < 1}">
	                <div style="text-align: center">
	                    <p style="color:red;">Danh sách trống</p>
	                </div>
                </c:if>
                <comp:pagination ob="${followCompanies}" link="${LIST_FOLLOW_COMPANY}?"></comp:pagination>
            </div>
        </div>
    </div>
</section>

<!-- start footer -->
	<%@ include file="/WEB-INF/common/footer.jsp" %>
<!-- end footer -->
</body>
</html>