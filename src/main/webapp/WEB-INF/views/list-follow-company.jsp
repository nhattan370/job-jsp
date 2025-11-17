<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head><%@ include file="/WEB-INF/common/head.jsp" %></head>
<body>

<!-- start nav -->
	<%@ include file="/WEB-INF/common/navbar.jsp" %>
<!-- end nav -->
<%-- <div th:if="${success}" class="toast" data-delay="2000" style="position:fixed;top: 100PX; right: 10PX;z-index: 2000;width: 300px">
    <script>
        swal({
            title: 'Xóa thành công!',
            /* text: 'Redirecting...', */
            icon: 'success',
            timer: 3000,
            buttons: true,
            type: 'success'
        })
    </script>
</div> --%>
<!-- END nav -->
<%-- <div class="hero-wrap hero-wrap-2" style="background-image: url('user/assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5" th:if="${session.user.role.id == 1 }">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">
                <p class="breadcrumbs mb-0"><span class="mr-3"><a href="/">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span>Công ty <span></span></p>
                <h1 class="mb-3 bread">Danh sách công ty đã theo dõi</h1>
            </div>
        </div>
    </div>
</div> --%>

   <jsp:include page="/WEB-INF/common/page-hero.jsp">
  		<jsp:param value="Danh sách công ty đã theo dõi" name="title"/>
  		<jsp:param value="Công ty" name="breadcrumb"/>
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
            	<c:if test="${followCompanies.size() > 0}">
                <div class="row">
                	<c:forEach var="follow" items="${followCompanies}">
                        <div class="col-md-12 ">
                            <div class="job-post-item p-4 d-block d-lg-flex align-items-center" id="job-item-${follow.id}">
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
                                        <a data-toggle="modal" data-target="#deleteModal${follow.id}" class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
                                            <span class="icon-delete"></span>
                                        </a>
                                    </div>
                                    <a href="${DETAIL_COMPANY}${follow.company.id}" class="btn btn-primary py-2">Chi tiết</a>
                                    <a href="${LIST_POST}${follow.company.id}" class="btn btn-warning py-2 ml-1">Danh sách bài đăng</a>
                                </div>
                            </div>
                        </div>
                        <!-- end -->
                        <!-- Modal xác nhận xóa -->
					    <div class="modal fade" id="deleteModal${follow.id}" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel${follow.id}" aria-hidden="true">
					        <div class="modal-dialog modal-dialog-centered" role="document">
					            <div class="modal-content border-0 shadow">
					                <div class="modal-header bg-danger text-white">
					                    <h5 class="modal-title" id="deleteModalLabel${follow.id}">Xác nhận xóa</h5>
					                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
					                        <span aria-hidden="true">&times;</span>
					                    </button>
					                </div>
					
					                <form>
					                    <div class="modal-body">
					                        <p>Bạn có chắc chắn muốn <strong>bỏ theo dõi</strong> công ty
					                            <span class="text-primary font-weight-bold">${follow.company.nameCompany}</span> không?</p>
					                    </div>
					                    <div class="modal-footer">
					                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
					                        <button type="button" class="btn btn-danger" onclick="deleteFollowCompany(${follow.id})">Đồng ý</button>
					                    </div>
					                </form>
					            </div>
					        </div>
					    </div>
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
<!-- <script>
    function save(id){
        var name = "#idRe" +id;
        var idRe = $(name).val();
        var formData = new FormData();
        formData.append('idRe', idRe);
        $.ajax(
            {
                type: 'POST',
                url: '/save-job/save/',
                contentType: false,
                processData: false,
                data: formData,
                success: function (data) {
                    if(data == "false"){
                        swal({
                            title: 'Bạn cần phải đăng nhập!',
                            /* text: 'Redirecting...', */
                            icon: 'error',
                            timer: 3000,
                            buttons: true,
                            type: 'error'
                        })
                    }else if(data == "true"){
                        swal({
                            title: 'Lưu thành công!',
                            /* text: 'Redirecting...', */
                            icon: 'success',
                            timer: 3000,
                            buttons: true,
                            type: 'success'
                        })
                    }else{
                        swal({
                            title: 'Bạn đã lưu bài này rồi!',
                            /* text: 'Redirecting...', */
                            icon: 'error',
                            timer: 3000,
                            buttons: true,
                            type: 'error'
                        })
                    }
                },
                error: function (err) {
                    alert(err);
                }
            }
        )
    }
</script> -->
<!-- start footer -->
	<%@ include file="/WEB-INF/common/footer.jsp" %>
<!-- end footer -->
</body>
</html>