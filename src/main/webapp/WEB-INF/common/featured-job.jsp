<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/more/apply-save-job.css">
<section class="ftco-section bg-light">
<!-- show toast -->
<div id="alert-container" style="position: fixed; top: 20px; right: 20px; z-index: 9999;"></div>

<!-- container feature job -->
    <div class="container">
        <div class="row">
            <div class="col-lg-9 pr-lg-5">
                <div class="row justify-content-center pb-3">
                    <div class="col-md-12 heading-section ">
                        <span class="subheading">CÔNG VIỆC ĐƯỢC NHIỀU NGƯỜI ỨNG TUYỂN</span>
                        <h2 class="mb-4">Các bài đăng về việc làm nổi bật</h2>

                    </div>
                </div>
                <div class="row">
                    <c:forEach  var="recruitment" items="${recruitments}">
                        <div class="col-md-12 ">
                            <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
                                <div class="one-third mb-4 mb-md-0">
                                    <div class="job-post-item-header align-items-center">
                                        <span class="subadge">${recruitment.type}</span>
                                        <h2 class="mr-3 text-black"><a href="recruitment/detail?${recruitment.id}">${recruitment.title}</a></h2>
                                    </div>
                                    <div class="job-post-item-body d-block d-md-flex">
                                        <div class="mr-3"><span class="icon-layers"></span> <a href="#">${recruitment.nameCompany}</a></div>
                                        <div><span class="icon-my_location"></span> <span>${recruitment.address}</span></div>
                                    </div>
                                </div>
                                <input type="hidden" id="idRe${recruitment.id}" value="${recruitment.id}">
<%--                                 <div th:if="${session.user}" class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
                                    <div th:if="${session.user.role.id == 1}">
                                        <a onclick="save(${recruitment.id})" class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
                                            <span class="icon-heart"></span>
                                        </a>
                                    </div>
                                    <a th:if="${session.user.role.id == 1}" data-toggle="modal" data-target="#exampleModal${recruitment.id}" class="btn btn-primary py-2">Apply Job</a>
                                </div> --%>
                                <sec:authorize access="hasAuthority('USER') || !isAuthenticated()">
  	                                <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
	                                    <div>
	                                        <a onclick="save(${recruitment.id})" class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
	                                            <span class="icon-heart"></span>
	                                        </a>
	                                    </div>
	                                    <a data-toggle="modal" data-target="#exampleModal${recruitment.id}" class="btn btn-primary py-2">Apply Job</a>
	                                </div>
                                </sec:authorize>
                      
                            </div>
                        </div>
                        <!-- end -->
                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal${recruitment.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Ứng tuyển: <span>${recruitment.title}</span></h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form method="post" action="user/apply-job">
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col-12">
                                                    <select id="choose${recruitment.id}" onchange="choosed(${recruitment.id})" class="form-control" aria-label="Default select example">
                                                        <option selected>Chọn phương thức nộp</option>
                                                        <option value="1">Dùng cv đã cập nhật</option>
                                                        <option value="2">Nộp cv mới</option>
                                                    </select>
                                                </div>
                                                <div id="loai1${recruitment.id}" style="display:none" class="col-12">
                                                    <label for="fileUpload"
                                                           class="col-form-label">Giới thiệu:</label>
                                                    <textarea rows="10" cols="3" class="form-control" id="text${recruitment.id}" ></textarea>
                                                </div>
                                                <div id="loai2${recruitment.id}" style="display:none" class="col-12">

                                                    <label for="fileUpload"
                                                           class="col-form-label">Chọn cv:</label>
                                                    <input type="file" class="form-control"
                                                           id="fileUpload${recruitment.id}" name="file" required>
                                                    <label for="fileUpload"
                                                           class="col-form-label">Giới thiệu:</label>
                                                    <textarea rows="10" cols="3" class="form-control" id="text${recruitment.id}" ></textarea>
                                                </div>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                                <button type="button" id="button1${recruitment.id}" style="display: none" onclick="apply1(${recruitment.id})" class="btn btn-primary">Nộp</button>
                                                <button type="button" id="button2${recruitment.id}" style="display: none" onclick="apply(${recruitment.id})" class="btn btn-primary">Nộp</button>
                                            </div>
                                        </div>
                                    </form>


                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>
            <div class="col-lg-3 sidebar">
                <div class="row justify-content-center pb-3">
                    <div class="col-md-12 heading-section ">
                        <h2 class="mb-4">Công ty nổi bật</h2>
                    </div>
                </div>
                <c:forEach items="${companies}" var="company">
	                <div class="sidebar-box">
	                    <div class="">
	                        <a href="user/detail-company?${company.id}" class="company-wrap"><img src="${company.logo}" class="img-fluid" alt="Colorlib Free Template"></a>
	                        <div class="text p-3">
	                            <h3><a href="/user/detail-company?${company.id}">${company.nameCompany}</a></h3>
	                            <p><span class="number" style="color: black">${company.totalRecruitments}</span> <span>Vị trí ứng tuyển</span></p>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>
<script src="${pageContext.request.contextPath}/assets/js/more/save-job.js"></script>