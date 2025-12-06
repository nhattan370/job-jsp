<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/common/url.jspf" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/more/login.css">
</head>
<body>
	<div class="login-container">
	    <h2>Login</h2>
	    <form action="verify-login" method="post">
	    	<input type="hidden" name="redirect" value="${param.redirect}">
	        <div class="form-group">
	            <label for="email">Email</label>
	            <input type="email" id="email" name="email" required>
	            <c:if test="${param.error}">
	            	<small style = "color:red"> Email or password is wrong</small>            
	            </c:if>
	        </div>
	        <div class="form-group">
	            <label for="password">Password</label>
	            <input type="password" id="password" name="password" required>
	            <c:if test="${param.error}">
	            	<small style = "color:red"> Email or password is wrong</small>            
	            </c:if>
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
</html>