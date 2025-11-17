<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head><%@ include file="/WEB-INF/common/head.jsp" %></head>
<body>
<!-- start nav -->
	<%@ include file="/WEB-INF/common/navbar.jsp" %>
<!-- end nav -->


<!-- END nav -->
<%-- <div class="hero-wrap hero-wrap-2" style="background-image: url(${pageContext.request.contextPath}/assets/images/bg_1.jpg);" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">
                <p class="breadcrumbs mb-0"><span class="mr-3"><a href="${pageContext.request.contextPath}">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span>Công việc <span></span></p>
                <h1 class="mb-3 bread">Danh sách công việc đã lưu</h1>
            </div>
        </div>
    </div>
</div>  --%>

   <jsp:include page="/WEB-INF/common/page-hero.jsp">
  		<jsp:param value="Danh sách công việc đã lưu" name="title"/>
  		<jsp:param value="Công việc" name="breadcrumb"/>
  </jsp:include> 

<%-- <div class="hero-wrap hero-wrap-2" style="background-image: url('user/assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5" th:if="${session.user.role.id == 2 }">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">

                <h1 class="mb-3 bread">Không tìm thấy trang yêu cầu</h1>
            </div>
        </div>
    </div>
</div> --%>

<section class="ftco-section bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 pr-lg-5">
            	<c:if test="${saveJobList.size() > 0}">
                <div class="row">
                    <c:forEach var="saveJob" items="${saveJobList}">
                        <div class="col-md-12 ">
                            <div class="job-post-item p-4 d-block d-lg-flex align-items-center" id="job-item-${saveJob.id}">
                                <div class="one-third mb-4 mb-md-0">
                                    <div class="job-post-item-header align-items-center">
                                        <span class="subadge">${saveJob.recruitment.type}</span>
                                        <h2 class="mr-3 text-black" ><a href="user/recruitment-detail/${saveJob.recruitment.id}">${saveJob.recruitment.title}</a></h2>
                                    </div>
                                    <div class="job-post-item-body d-block d-md-flex">
                                        <div class="mr-3"><span class="icon-layers"></span> <a href="#">${saveJob.recruitment.company.nameCompany}</a></div>
                                        <div><span class="icon-my_location"></span> <span >${saveJob.recruitment.address}</span></div>
                                    </div>
                                </div>
                                <input type="hidden" id="idSa${saveJob.id}" value="${saveJob.id}">
                                <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
                                    <div>
                                        <a data-toggle="modal" data-target="#deleteModal${saveJob.id}" class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
                                            <span class="icon-delete"></span>
                                        </a>
                                    </div>
                                    <a  data-toggle="modal" data-target="#exampleModal${saveJob.recruitment.id}" class="btn btn-primary py-2">Apply Job</a>
                                </div>
                            </div>
                        </div>
                        <!-- end -->
                        
                        <!-- Modal xác nhận xóa -->
					    <div class="modal fade" id="deleteModal${saveJob.id}" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel${saveJob.id}" aria-hidden="true">
					        <div class="modal-dialog modal-dialog-centered" role="document">
					            <div class="modal-content border-0 shadow">
					                <div class="modal-header bg-danger text-white">
					                    <h5 class="modal-title" id="deleteModalLabel${saveJob.id}">Xác nhận xóa</h5>
					                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
					                        <span aria-hidden="true">&times;</span>
					                    </button>
					                </div>
					
					                <form>
					                    <div class="modal-body">
					                        <p>Bạn có chắc chắn muốn <strong>bỏ lưu</strong> công việc
					                            <span class="text-primary font-weight-bold">${saveJob.recruitment.title}</span> không?</p>
					                    </div>
					                    <%-- <input type="hidden" id="idSa${saveJob.recruitment.id}" value="${saveJob.recruitment.id}"> --%>
					                    <div class="modal-footer">
					                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
					                        <button type="button" class="btn btn-danger" onclick="deleteSaveJob(${saveJob.id})">Đồng ý</button>
					                    </div>
					                </form>
					            </div>
					        </div>
					    </div>
                       <jsp:include page="/WEB-INF/common/apply-modal.jsp">
	                   		<jsp:param value="${saveJob.recruitment.id}" name="id"/>
	                   		<jsp:param value="${saveJob.recruitment.title}" name="title"/>
	                   </jsp:include>
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