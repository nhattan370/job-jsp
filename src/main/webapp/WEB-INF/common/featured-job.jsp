<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix = "comp" tagdir="/WEB-INF/tags" %>

<section class="ftco-section bg-light">

<%@ include file="/WEB-INF/common/url.jspf" %>
<!-- show toast -->
<!-- <div id="alert-container" style="position: fixed; top: 60px; left: 20px; z-index: 9999;"></div> -->

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
                   	<c:forEach var="recruitment" items="${recruitments}">
    					<comp:applySave 
    						re="${recruitment}" 
    						DETAIL_COMPANY="${DETAIL_COMPANY}" 
    						DETAIL_RECRUITMENT="${DETAIL_RECRUITMENT}"/>
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
	                        <a href="${DETAIL_COMPANY}${company.id}" class="company-wrap"><img src="${company.logo}" class="img-fluid" alt="Colorlib Free Template"></a>
	                        <div class="text p-3">
	                            <h3><a href="${DETAIL_COMPANY}${company.id}">${company.nameCompany}</a></h3>
	                            <p><span class="number" style="color: black">${company.totalRecruitments}</span> <span>Vị trí ứng tuyển</span></p>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>