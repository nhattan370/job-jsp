<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="vi">
<head>
	<%@ include file="/WEB-INF/common/head.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/more/eye-icon.css">
    <meta charset="UTF-8">
    <title>Đặt lại mật khẩu</title>
</head>
<body class="bg-light">
<sec:authorize access="hasAuthority('FORGOT_PASSWORD')">
	<div class="container mt-5">
	    <div class="row justify-content-center">
	        <div class="col-md-6">
	            <div class="card shadow-sm">
	                <div class="card-body">
	                    <h4 class="card-title text-center mb-4">Đặt lại mật khẩu</h4>
	                    <form:form action="${RESET_PASSWORD}" method="post" modelAttribute="resetPasswordDTO">
	                        <div class="form-group">
	                            <label for="password">Mật khẩu mới</label>
	                            <div class="password-wrapper">
		                            <form:input type="password" class="form-control" id="password" path="password"/>
		                            <span id="togglePassword" class="ion-ios-eye-off toggle-password"></span>
	                            </div>
	                            <small class="text-danger"><form:errors path="password" /></small>
	                        </div>
	
	                        <div class="form-group">
	                            <label for="confirmPassword">Nhập lại mật khẩu</label>
	                            <form:input type="password" class="form-control" id="confirmPassword" path="confirmPassword"/>
	                            <small class="text-danger"><form:errors path="confirmPassword" /></small>
	                        </div>
	                        
	                        <button type="submit" class="btn btn-primary btn-block">Xác nhận đổi mật khẩu</button>
	                    </form:form>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</sec:authorize>
</body>
<script src="${pageContext.request.contextPath}/assets/js/more/icon-password.js"></script>
</html>