<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<div class="hero-wrap hero-wrap-2" style="background-image: url(${pageContext.request.contextPath}/assets/images/bg_1.jpg);" data-stellar-background-ratio="0.5">
	    <div class="overlay"></div>
	    <div class="container">
	        <div class="row no-gutters slider-text align-items-end justify-content-start">
	            <div class="col-md-12 text-center mb-5">
	                <p class="breadcrumbs mb-0"><span class="mr-3"><a href="${pageContext.request.contextPath}">Trang chủ <i class="ion-ios-arrow-forward"></i></a></span><span>${param.breadcrumb}</span></p>
	                <h1 class="mb-3 bread">${param.title}</h1>
	            </div>
	        </div>
	    </div>
	</div>