<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="comp" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html>
<html lang="en">
<head><%@ include file="/WEB-INF/common/head.jsp" %></head>
<body>
<c:if test="${not empty mes}">
	<script type="text/javascript">
	    swal({
		    title: "${mes}",
		    text: "Redirecting...", 
		    icon: "${status}",
		    timer: 2000,
		    buttons: true
		}); 
	</script>
</c:if>
<%@ include file="/WEB-INF/common/navbar.jsp" %>

<comp:bannerProfile image="${companyDTO.logo}" id="fileUploadLogoCompany" title="Hồ sơ công ty"/>

<section class="site-section" style="margin-top: 10px">
    <div class="container">
        <div class="row justify-content-center">
			<div class="col-lg-8">
				<form:form action="${UPDATE_COMPANY}" method="post" class="p-4 p-md-5 bg-white border rounded shadow-sm" modelAttribute="companyDTO">
				    <h3 class="text-dark mb-4 pb-2 border-bottom font-weight-bold">
				        Thông tin công ty
				    </h3>
				
				    <div class="form-group mb-4">
				        <label for="email" class="font-weight-bold">Email</label>
				        <form:input class="form-control form-control-lg" id="email" path="email" placeholder="you@yourdomain.com" />
				        <small class="text-danger"><form:errors path="email" /></small>
				    </div>
				
				    <div class="form-group mb-4">
				        <label for="name" class="font-weight-bold">Tên công ty</label>
				        <form:input class="form-control form-control-lg" id="name" path="name" placeholder="FPT Software" />
				        <small class="text-danger"><form:errors path="name" /></small>
				    </div>
				
				    <div class="form-group mb-4">
				        <label for="address" class="font-weight-bold">Địa chỉ</label>
				        <form:input class="form-control form-control-lg" id="address" path="address" placeholder="e.g. New York" />
				        <small class="text-danger"><form:errors path="address" /></small>
				    </div>
				
				    <div class="form-group mb-4">
				        <label for="phoneNumber" class="font-weight-bold">Số điện thoại</label>
				        <form:input class="form-control form-control-lg" id="phoneNumber" path="phoneNumber" placeholder="+84" />
				        <small class="text-danger"><form:errors path="phoneNumber" /></small>
				    </div>
				
				    <div class="form-group mb-4">
				        <label for="description" class="font-weight-bold">Mô tả công ty</label>
				        <form:textarea class="form-control form-control-lg" id="description" path="description" rows="4" placeholder="Mô tả"></form:textarea>
				    </div>
				
				    <button type="submit" class="btn btn-primary btn-block btn-lg">
				        Lưu thông tin
				    </button>
				
				</form:form>
			</div>
		</div>
    </div>
</section>
<%@ include file="/WEB-INF/common/footer.jsp" %>
<jsp:include page="/WEB-INF/common/loading-overlay.jsp"></jsp:include>
</body>
</html>