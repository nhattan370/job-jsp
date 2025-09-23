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

<div class="hero-wrap hero-wrap-2" style="background-image: url(${pageContext.request.contextPath}/assets/images/bg_1.jpg);" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">
                <p class="breadcrumbs mb-0"><span class="mr-3"><a href="index.html">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span>Chi tiết <span></span></p>
                <h1 class="mb-3 bread">Chi tiết công ty</h1>
            </div>
        </div>
    </div>
</div>

<section style="margin-top: 10px" class="site-section">
    <div class="container">
        <div class="row align-items-center mb-5">
            <div class="col-lg-8 mb-4 mb-lg-0">
                <div class="d-flex align-items-center">
                    <div class="border p-2 d-inline-block mr-3 rounded">
                        <img width="100" height="100" th:src="${company.logo}" alt="Image">
                    </div>
                    <div>
                        <h2 th:text="${company.nameCompany}"></h2>
                        <div>
                            <span class="icon-briefcase mr-2"></span><span th:text="${company.email}" class="ml-0 mr-2 mb-2"></span>
                            <span  class="icon-room mr-2"></span ><span th:text="${company.address}" class="m-2"></span>

                        </div>
                        <input type="hidden" id="idCompany">
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="row">
                    <div th:if="${session.user}" class="col-6">
                        <a th:if="${session.user.role.id == 1}" onclick="follow()" class="btn btn-block btn-light btn-md"><span class="icon-heart-o mr-2 text-danger"></span>Theo dõi</a>
                    </div>
                    <div th:unless="${session.user}" class="col-6">
                        <a  onclick="follow()" class="btn btn-block btn-light btn-md"><span class="icon-heart-o mr-2 text-danger"></span>Theo dõi</a>
                    </div>
                    <div class="col-6">

                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8">
                <div class="mb-5">

                    <h3 class="h5 d-flex align-items-center mb-4 text-primary"><span class="icon-align-left mr-3"></span>Mô tả công việc</h3>
                    <p th:utext="${company.description}"></p>
                </div>

            </div>
            <div class="col-lg-4">
                <div class="bg-light p-3 border rounded mb-4">
                    <h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Tóm tắt công việc</h3>
                    <ul class="list-unstyled pl-3 mb-0">

                        <li class="mb-2"><strong class="text-black">Email công ty: </strong> <span th:text="${company.email}"></span></li>
                        <li class="mb-2"><strong class="text-black">Số điện thoại: </strong> <span th:text="${company.phoneNumber}"></span></li>
                        <li class="mb-2"><strong class="text-black">Đại chỉ: </strong> <span th:text="${company.address}"></span></li>
                    </ul>
                </div>

                <div class="bg-light p-3 border rounded">
                    <h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Share</h3>
                    <div class="px-3">
                        <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-facebook"></span></a>
                        <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-twitter"></span></a>
                        <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-linkedin"></span></a>
                        <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-pinterest"></span></a>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <script>
        function follow(){
            var name = "#idCompany";
            var idCompany = $(name).val();
            var formData = new FormData();
            formData.append('idCompany', idCompany);
            $.ajax(
                {
                    type: 'POST',
                    url: '/user/follow-company/',
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
                                title: 'Theo dõi thành công!',
                                /* text: 'Redirecting...', */
                                icon: 'success',
                                timer: 3000,
                                buttons: true,
                                type: 'success'
                            })
                        }else{
                            swal({
                                title: 'Bạn đã theo dõi công ty này!',
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
    </script>
</section>

<!-- start footer -->
	<%@ include file="/WEB-INF/common/footer.jsp" %>
<!-- end footer -->
</body>
</html>