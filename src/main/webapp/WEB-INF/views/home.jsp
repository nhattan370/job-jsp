<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/common/head.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/more/categories.css">
</head>
<body>
<!-- start nav -->
	<%@ include file="/WEB-INF/common/navbar.jsp" %>

<!-- show swal -->
	<c:if test="${not empty sessionScope.mes}">
	    <script type="text/javascript">
	        swal({
	            title: "<c:out value='${sessionScope.mes}'/>",
	            text: "Redirecting...", 
	            icon: "success",
	            timer: 2000,
	            buttons: true
	        });
	    </script>
	    <c:remove var="mes" scope="session"/>	
	</c:if>

<!-- general interface -->
	<%@include file="/WEB-INF/common/general.jsp" %>

	<section class="ftco-section">
	    <div class="container">
	        <div class="row justify-content-center mb-5">
	            <div style="display: block" class="col-md-7 heading-section text-center">
	                <span class="subheading">Danh mục công việc</span>
	                <h2 class="mb-0">Top Danh Mục</h2>
	            </div>
	        </div>
	        
	        <!--Render in js  --> 
			<div id="carouselExampleControls" class="carousel slide" data-ride="carousel" data-interval="3500">
				<div class="carousel-inner" id="category-container"></div>
			
				<a class="carousel-control-prev prev" href="#carouselExampleControls" role="button" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="carousel-control-next next" href="#carouselExampleControls" role="button" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>	
	        <!--Render in js  -->
	        
	    </div>
	</section>

	<section class="ftco-section services-section">
	    <div class="container">
	        <div class="row d-flex">
	            <div class="col-md-3 d-flex align-self-stretch ">
	                <div class="media block-6 services d-block">
	                    <div class="icon"><span class="flaticon-resume"></span></div>
	                    <div class="media-body">
	                        <h3 class="heading mb-3">Tìm kiếm hàng triệu việc làm</h3>
	                        <p> ở và nguồn cung cấp của họ.Cơ hội nghề nghiệp phong phú, chỉ một cú nhấp chuột để bắt đầu hành trình mới.</p>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-3 d-flex align-self-stretch ">
	                <div class="media block-6 services d-block">
	                    <div class="icon"><span class="flaticon-team"></span></div>
	                    <div class="media-body">
	                        <h3 class="heading mb-3">Dễ dàng quản lý công việc</h3>
	                        <p>Theo dõi, sắp xếp và tối ưu hóa công việc của bạn mọi lúc, mọi nơi.</p>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-3 d-flex align-self-stretch ">
	                <div class="media block-6 services d-block">
	                    <div class="icon"><span class="flaticon-career"></span></div>
	                    <div class="media-body">
	                        <h3 class="heading mb-3">Top Nghề nghiệp</h3>
	                        <p>Khám phá những ngành nghề hot nhất và định hướng sự nghiệp bền vững cho tương lai.</p>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-3 d-flex align-self-stretch ">
	                <div class="media block-6 services d-block">
	                    <div class="icon"><span class="flaticon-employees"></span></div>
	                    <div class="media-body">
	                        <h3 class="heading mb-3">Ứng viên Chuyên gia Tìm kiếm</h3>
	                        <p>Kết nối nhanh chóng với ứng viên chất lượng, phù hợp đúng nhu cầu tuyển dụng.</p>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>

	<%@include file="/WEB-INF/common/featured-job.jsp" %>

	<!-- start footer -->
	<%@ include file="/WEB-INF/common/footer.jsp" %>
	<!-- end footer -->

</body>
<script src="${pageContext.request.contextPath}/assets/js/more/category.js"></script>
</html>