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
	<comp:pageHero title="Chi tiết công ty" breadcrumb="Chi tiết"/>
<section style="margin-top: 10px" class="site-section">
    <div class="container">
        <div class="row align-items-center mb-5">
            <div class="col-lg-8 mb-4 mb-lg-0">
                <div class="d-flex align-items-center">
                    <div class="border p-2 d-inline-block mr-3 rounded">
                        <img width="100" height="100" src="${company.logo}" alt="Image">
                    </div>
                    <div>
                        <h2>${company.nameCompany}</h2>
                        <div>
                            <span class="icon-briefcase mr-2"></span><span class="ml-0 mr-2 mb-2">${company.email}</span>
                            <span  class="icon-room mr-2"></span ><span class="m-2">${company.address}</span>

                        </div>
                        <input type="hidden" id="idCompany" value="${company.id}">
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="row">
                    <div class="col-12">
                        <a onclick="follow()" class="btn btn-block btn-light btn-md">
                        	<span class="icon-heart-o mr-2 text-danger" id="heartIcon${company.id}"></span>
                        	<span id="followText${company.id}">Theo dõi</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8">
                <div class="mb-5">

                    <h3 class="h5 d-flex align-items-center mb-4 text-primary"><span class="icon-align-left mr-3"></span>Mô tả công ty</h3>
                    <p>${company.description}</p>
                </div>

            </div>
            <div class="col-lg-4">
                <div class="bg-light p-3 border rounded mb-4">
                    <h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Tóm tắt công việc</h3>
                    <ul class="list-unstyled pl-3 mb-0">

                        <li class="mb-2"><strong class="text-black">Email công ty: </strong> <span>${company.email}</span></li>
                        <li class="mb-2"><strong class="text-black">Số điện thoại: </strong> <span>${company.phoneNumber}</span></li>
                        <li class="mb-2"><strong class="text-black">Đại chỉ: </strong> <span>${company.address}</span></li>
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
</section>

<!-- start footer -->
	<%@ include file="/WEB-INF/common/footer.jsp" %>
<!-- end footer -->
</body>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/more/icon-heart.css">
</html>