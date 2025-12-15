<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/common/head.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <%@ include file="/WEB-INF/common/head.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/more/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/more/eye-icon.css">
</head>
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
	<div class="login-container">
		<c:if test="${not empty sessionScope.login_error}">
		    <div class="alert alert-warning">
		        <c:out value="${sessionScope.login_error}" escapeXml="false" />
		    </div>
		    <c:remove var="login_error" scope="session"/>
		</c:if>
		
		<c:if test="${not empty mes}">
		    <div class="alert alert-warning">
		        <p>Gửi mật khẩu thành công. Vui lòng truy cập 
		        	<a href="${GMAIL}">gmail</a> 
		        để lấy mật khẩu mới và tiến hành <Strong>đăng nhập lại</Strong></p>
		    </div>
		</c:if>
	
	    <h2>Login</h2>
	    <form action="verify-login" method="post">
	    	<input type="hidden" name="redirect" value="${param.redirect}">
	        <div class="form-group">
	            <label for="email">Email</label>
	            <input type="email" id="email" name="email" required>
	        </div>
	        <div class="form-group">
			    <label for="password">Password</label>
			    <div class="password-wrapper">
				    <input type="password" id="password" name="password" required>
				    <span id="togglePassword" class="ion-ios-eye-off toggle-password"></span>
			    </div>
			</div>
			<div class="form-group text-right">
			    <a href="${FORGOT_PASSWORD_PAGE}"
			       class="text-primary">
			        Quên mật khẩu?
			    </a>
			</div>
	        <div class="form-group">
	            <button type="submit">Login</button>
	        </div>
	        
	        <div class="demo-link">
			    <a href="test-account" target="_blank">
			        🚀 Tài khoản demo
			    </a>
			</div>
			<div class="register-link text-center">
    			<p class="text-muted">Chưa có tài khoản?
			        <a href="${SHOW_REGISTER_PAGE}" class="font-weight-bold">Đăng ký ngay</a>
			    </p>
			</div>
			
	    </form>
	</div>
</body>
<script src="${pageContext.request.contextPath}/assets/js/more/icon-password.js"></script>
</html>